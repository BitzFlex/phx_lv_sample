defmodule PhxLvSampleWeb.Samples.Blink do
  use PhxLvSampleWeb, :live_view

  @moduledoc """
    tailwind.config.js 를 이용한 blink animation
  """


  def render(assigns) do
    ~H"""
    <div class="">

      <div class="text-2xl font-bold text-blue-800 animate-blink">BLINK Sample using tailwind </div>

      <hr>
      <p>
        class="...animate-blink"
      </p>

      <pre>
        <code>
          tainwind.config.js

        ...
          theme: {
            extend: {
              colors: {
                brand: "#FD4F00",
              },
              keyframes: {
                blink: {
                  '0%, 100%': { opacity: '1' },
                  '50%': { opacity: '0' },
                }
              },
              animation: {
                blink: 'blink 1s infinite'
              }
            },
          },
        ...

        </code>
      </pre>

    </div>
    """
  end


  def mount(_params, _session, socket) do
    {:ok, socket}
  end


end
