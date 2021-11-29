defmodule BreastFeedingBlogWeb.Article do
  use BreastFeedingBlogWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :type, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Статті</h1>
      <%= @type %>
    """
  end
end
