defmodule TuxApi.TuxController do
  use TuxApi.Web, :controller

  def process(conn, params) do
    data = %{
      avg_per_month: [10.0, 12.0, 14.0, 15.0, 10.0, 11.0, 10.0, 12.0, 14.0, 15.0, 10.0, 11.0 ],
      num_rentals_processed: 8716,
      processing_time: 0.668
    }
    render conn, "process.json", data: data
  end
end
