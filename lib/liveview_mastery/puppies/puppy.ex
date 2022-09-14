defmodule LiveviewMastery.Puppies.Puppy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "puppies" do
    field :breed, :string
    field :name, :string
    field :photo_url, :string

    timestamps()
  end

  @doc false
  def changeset(puppy, attrs) do
    puppy
    |> cast(attrs, [:name, :breed, :photo_url])
    |> validate_required([:name, :breed, :photo_url])
  end
end
