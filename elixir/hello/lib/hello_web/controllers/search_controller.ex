defmodule HelloWeb.SearchController do
  use HelloWeb, :controller

  def search(conn, params) do
    IO.puts("searching " <> inspect(params))
    conn
    |> put_resp_content_type("application/json")

    try do
      #results = Hello.SecondaryRepo.search_products(params["q"],params["limit"],params["offset"])
      results = %{num_rows: 100}
      IO.puts("controller: " <> inspect(results.num_rows))
      conn |> send_resp(200,Jason.encode!(results.num_rows))

    rescue
      e in RuntimeError -> e
      results = ['failed']
      conn |> send_resp(200,Jason.encode!(results))
    end

  end
end
