defmodule Hello.Question.QuestionTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question_templates" do
    field :tmpl, :string
    field :formula, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question_template, attrs) do
    question_template
    |> cast(attrs, [:tmpl, :formula])
    |> validate_required([:tmpl, :formula])
  end
end
