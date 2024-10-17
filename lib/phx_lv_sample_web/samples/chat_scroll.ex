defmodule PhxLvSampleWeb.Samples.ChatScroll do
  use PhxLvSampleWeb, :live_view

  @moduledoc """
    temporary_assigns을 이용 예제
  """


  def render(assigns) do
    ~H"""
      <input phx-keyup="key_up_event" phx-key="Enter" phx-value-tag="chat" class="h-8 rounded-lg text-zinc-900 focus:ring-0 sm:text-sm sm:leading-6" type="text" placeholder="message...">

      <%!-- <div class="h-32 bg-blue-50">abc</div> --%>

      <div class="h-32 bg-blue-50 border border-lime-400 overflow-hidden overflow-y-auto"
           id="chat-messages"  phx-update="append">
        <%= for message <- @messages do %>
          <p id={message.id}>
            <%= message.text %>
          </p>
        <% end %>
      </div>
    """
  end


  def mount(_params, _session, socket) do
    messages = 1..10
                |> Enum.map(fn i -> %{id: "#{i}" , text: "message : #{i}"} end)
    last_message_id = Enum.count(messages)

    socket = socket
              |> assign(:messages, messages )
              |> assign(:last_message_id, last_message_id)
    {:ok, socket , temporary_assigns: [messages: []]}

  end



  def handle_event(event, param, socket) do
    socket =
      case event do
        "key_up_event" -> %{"value" => message} = param
                          last_message_id = socket.assigns.last_message_id + 1
                          assign(socket, :messages, [%{id: "#{last_message_id}" , text: message}  ])
                              |> assign(:last_message_id , last_message_id)
        _ -> socket
      end

    {:noreply, socket}
  end



end
