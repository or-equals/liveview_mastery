defmodule LiveviewMastery.Repo.Migrations.AddCuteToPuppies do
  use Ecto.Migration

  def change do
    alter table(:puppies) do
      add :cuteness, :boolean, null: false, default: true
    end
  end
end
