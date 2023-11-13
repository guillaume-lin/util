defmodule Hello.Repo.Migrations.CreatePapers do
  use Ecto.Migration

  def change do
    create table(:papers) do
      add :question_tmpl_id, references(:question_templates)

      timestamps(type: :utc_datetime)
    end
  end
end
