defmodule PhxLvSampleWeb.Samples.Blink do
  use PhxLvSampleWeb, :live_view

  @moduledoc """
    tailwind.config.js 를 이용한 blink animation
  """


  def render(assigns) do
    ~H"""
    <div class="text-2xl font-bold text-blue-800 animate-blink">
      BLINK
    </div>
    """
  end


  def mount(_params, _session, socket) do
    {:ok, socket}
  end


end
