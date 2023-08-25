defmodule LiveviewMastery.Repo.Migrations.CreatePuppies do
  use Ecto.Migration

  def change do
    create table(:puppies) do
      add :name, :string
      add :color, :string
      add :breed, :string

      timestamps()
    end
  end
end
