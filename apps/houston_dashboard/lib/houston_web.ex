defmodule HoustonDashboard do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use HoustonDashboard, :controller
      use HoustonDashboard, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: HoustonDashboard
      import Plug.Conn
      import HoustonDashboard.Gettext
      import Phoenix.LiveView.Controller, only: [live_render: 3]
      alias HoustonDashboard.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/houston_dashboard/templates",
        namespace: HoustonDashboard

      use Phoenix.HTML

      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import HoustonDashboard.ErrorHelpers
      import HoustonDashboard.Gettext
      import Phoenix.LiveView, only: [live_render: 2, live_render: 3, live_link: 1, live_link: 2]

      alias HoustonDashboard.Router.Helpers, as: Routes
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView

      import Phoenix.LiveView, only: [live_render: 2, live_render: 3, live_link: 1, live_link: 2]
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      import HoustonDashboard.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
