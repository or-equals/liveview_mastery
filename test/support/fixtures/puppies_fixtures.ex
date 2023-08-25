defmodule LiveviewMastery.PuppiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewMastery.Puppies` context.
  """

  @doc """
  Generate a puppy.
  """
  def puppy_fixture(attrs \\ %{}) do
    {:ok, puppy} =
      attrs
      |> Enum.into(%{
        breed: "some breed",
        name: "some name",
        color: "some color",
        cuteness: true,
        photo_url: "some photo_url"
      })
      |> LiveviewMastery.Puppies.create_puppy()

    puppy
  end
end
