defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.MyXQL
end


defmodule Hello.SecondaryRepo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.MyXQL

  def search_products(q,limit,offset) do
    query = q
    sql = """
          SELECT *
            FROM yx_store_item_attr_value K
          LEFT JOIN  yx_store_item A     ON  K.item_id = A.id
          LEFT JOIN  yx_store_category B ON  A.category_id = B.id
          LEFT JOIN yx_store_category C  ON  B.pid = C.id
          LEFT JOIN yx_store_category D  ON  C.pid = D.id
          WHERE
	          K.NAME LIKE '%#{query}%'
	          OR K.bar_code LIKE '%#{query}%'
	          OR store_info LIKE '%#{query}%'
	          OR A.brand LIKE '%#{query}%'

	          OR B.brand LIKE '%#{query}%'
	          OR B.cate_name LIKE '%#{query}%'
	          OR C.brand LIKE '%#{query}%'
	          OR C.cate_name LIKE '%#{query}%'
	          OR D.brand LIKE '%#{query}%'
	          OR D.cate_name LIKE '%#{query}%'

	          OR DESCRIPTION LIKE '%#{query}%'
	          OR A.name LIKE '%#{query}%'
	          OR keyword LIKE '%#{query}%'
	        ORDER BY
            K.sales desc
          limit #{limit} offset #{offset}
    """

      case Ecto.Adapters.SQL.query(Hello.SecondaryRepo,sql,[]) do
        {:ok, results} ->
          IO.puts("query OK. " <> inspect(results.num_rows))
          results
        {:error, reason} ->
            reason
            IO.puts("query error. " <> inspect(reason))
            %{num_rows: -1}
      end
  end
end
