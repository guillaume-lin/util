defmodule VistorManagement.Repo.Migrations.RenameAttributeInResource do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    rename table(:tickets), :residentId, to: :resident_id

    alter table(:tickets) do
      modify :resident_id, :text
      add :visit_start_date, :utc_datetime
      add :visit_end_date, :utc_datetime
    end
  end

  def down do
    alter table(:tickets) do
      remove :visit_end_date
      remove :visit_start_date
      modify :residentId, :text
    end

    rename table(:tickets), :resident_id, to: :residentId
  end
end
