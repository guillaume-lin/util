defmodule VistorManagement.Repo.Migrations.AddTicket do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:tickets, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true
      add :phone, :text, null: false
      add :name, :text, null: false
      add :residentId, :text
      add :follower, :bigint
      add :status, :text, null: false, default: "applied"
    end
  end

  def down do
    drop table(:tickets)
  end
end
