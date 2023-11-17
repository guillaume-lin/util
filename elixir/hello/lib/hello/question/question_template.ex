defmodule Hello.Question.QuestionTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question_templates" do
    field :tmpl, :string
    field :formula, :string

    timestamps(type: :utc_datetime)
  end

  #
  # 插入数据时使用该necoder进行映射
  #
  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(value, opts) do
      value
      |> Map.take([:id, :tmpl, :formula])
      |> Enum.map(fn {key, val} ->
        cond do
          key === :id -> {:tmpl_id, Map.get(value, :id)}
          true -> {key, val}
        end
      end)
      |> Enum.into(%{})
      |> Jason.Encode.map(opts)
    end
  end

  #
  #
  #
  def get_field_types do
    %{
      default_sorting_field: "tmpl_id",
      fields: [
        %{name: "tmpl_id", type: "int32"},
        %{name: "tmpl", type: "string", locale: "zh"},  # 很重要 搜索中文必须用locale
        %{name: "formula", type: "string", locale: "zh"}
      ]
    }
  end

  @doc  insert document
  def inject_document do
    QuestionTemplate |> Hello.Repo.all() |> ExTypesense.index_multiple_documents()
  end
  @doc search
  def search_document(word) do
    params = %{q: word, query_by: "tmpl"}
    ExTypesense.search("quetion_templates",params)
  end

  @doc false
  def changeset(question_template, attrs) do
    question_template
    |> cast(attrs, [:tmpl, :formula])
    |> validate_required([:tmpl, :formula])
  end
end
