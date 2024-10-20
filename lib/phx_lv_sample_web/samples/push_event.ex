defmodule PhxLvSampleWeb.Samples.PushEvent do
  use PhxLvSampleWeb, :live_view


  def render(assigns) do
    ~H"""
      <button type="button" phx-click="PushEvent"
              class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
              Push Event
      </button>


      <div class="h-32 bg-blue-50 border border-lime-400 overflow-hidden overflow-y-auto"
            id="chat-messages"  phx-update="append" phx-hook="ScrollToBotton">
        phx-hook el
      </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  def handle_event("PushEvent", _unsigned_params, socket) do
    {:noreply, push_event(socket, "event_by_click", %{id: 1, name: "abd"})}
  end


end
