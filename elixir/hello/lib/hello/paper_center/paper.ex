defmodule Hello.PaperCenter.Paper do
  use Ecto.Schema
  import Ecto.Changeset

  schema "papers" do
    field :question_tmpl_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(paper, attrs) do
    paper
    |> cast(attrs, [:question_tmpl_id])
    |> validate_required([:question_tmpl_id])
  end
end
