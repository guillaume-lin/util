defmodule Hello.Question.QuestionTemplateAdmin do

  def form_fields(_) do
    [
      id: nil,
      tmpl: %{type: :textarea, rows: 4, name: "模板"},
      formula: %{type: :textarea, rows: 15}
    ]
  end

  def default_actions(schema) do
    IO.puts("default actions " <> inspect(schema))
    [
      :edit,
      :new,

      :delete,
      :generate
    ]
  end
  def widgets(_schema, _conn) do
    IO.puts("widgets for question template")
    [
      %{
        type: "tidbit",
        title: "average review",
        content: "4.8 /5.0",
        icon: "thumbs-up",
        order: 1,
        width: 6
      }
    ]
  end

  def list_actions(conn) do
    IO.puts("list actions")
    [
      # 批量操作在这里
    ]
  end
  def resource_actions(conn) do
    #单个资源
    IO.puts("resource actions")
    [
      generate: %{name: "生成", action: fn conn, p -> generate_paper(conn,p) end}
    ]
  end

  # 操作单个记录
  defp generate_paper(conn,questionTemplate) do
    IO.puts("generate papers")
    tmpl = questionTemplate
    IO.puts(inspect(tmpl))
    query = URI.encode_query(%{tmpl: tmpl.tmpl, formula: tmpl.formula})
    IO.puts(inspect(query))
    conn |> Phoenix.Controller.redirect(to: "/hanoi?" <> query)
    :ok
  end
end
