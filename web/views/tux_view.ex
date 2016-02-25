defmodule TuxApi.TuxView do
  use TuxApi.Web, :view

  def render("process.json", %{data: data}) do
    %{data: data}
  end
end
