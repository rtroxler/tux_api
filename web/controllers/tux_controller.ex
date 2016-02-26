defmodule TuxApi.TuxController do
  use TuxApi.Web, :controller
  require Logger
  require Tux

  def process_rates(conn, %{"unit_dimensions" => unit_dimensions, "city_name" => city_name}) do
    [unit_length, unit_width] = split_unit_dimensions(unit_dimensions)

    data =
    data = %{
      id: 1,
      type: "rate-datas",
      attributes: Tux.process(unit_length, unit_width, city_name)
    }

    render conn, "process.json", data: [ data ]
  end

  def process_all_rates(conn, _) do
    data = %{ things: "hi" }
    render conn, "process.json", data: data
  end

  def find_cities(conn, %{"unit_dimensions" => unit_dimensions}) do
    [unit_length, unit_width] = split_unit_dimensions(unit_dimensions)
    data = %{
      id: 1,
      type: "city-datas",
      attributes: Tux.popular_cities(unit_length, unit_width)
    }
    render conn, "process.json", data: data
  end

  defp split_unit_dimensions(unit_dimensions),
    do: String.split(unit_dimensions, "x") |> Enum.map(&String.to_integer/1)
end
