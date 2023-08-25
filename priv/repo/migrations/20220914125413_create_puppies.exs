defmodule LiveviewMastery.Repo.Migrations.CreatePuppies do
  use Ecto.Migration

  def change do
    create table(:puppies) do
      add :name, :string
      add :breed, :string
      add :color, :string
      add :photo_url, :string

      timestamps()
    end
  end
end
