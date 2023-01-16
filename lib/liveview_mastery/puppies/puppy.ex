defmodule LiveviewMastery.Puppies.Puppy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "puppies" do
    field :breed, :string
    field :color, :string
    field :name, :string
    field :cuteness, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(puppy, attrs) do
    puppy
    |> cast(attrs, [:name, :color, :breed, :cuteness])
    |> validate_required([:name, :color, :breed, :cuteness])
  end
end
