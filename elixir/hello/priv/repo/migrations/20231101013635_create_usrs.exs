defmodule Hello.Repo.Migrations.CreateUsrs do
  use Ecto.Migration

  def change do
    create table(:usrs) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :number_of_pets, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
