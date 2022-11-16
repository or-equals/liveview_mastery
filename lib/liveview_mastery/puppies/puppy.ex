defmodule LiveviewMastery.Puppies.Puppy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "puppies" do
    field :breed, :string
    field :color, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(puppy, attrs) do
    puppy
    |> cast(attrs, [:name, :color, :breed])
    |> validate_required([:name, :color, :breed])
  end
end
