defmodule Hello.Repo.Migrations.CreateQuestionTemplates do
  use Ecto.Migration

  def change do
    create table(:question_templates) do
      add :tmpl, :text
      add :formula, :string

      timestamps(type: :utc_datetime)
    end
  end
end
