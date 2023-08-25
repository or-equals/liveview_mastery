# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveviewMastery.Repo.insert!(%LiveviewMastery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
import LiveviewMastery.PuppiesFixtures

puppy_fixture(color: "Blonde", breed: "Golden Retriever", name: "Buddie")
puppy_fixture(color: "Blonde", breed: "Labrador Retriever", name: "Boomerang")
puppy_fixture(color: "Brindle", breed: "Labrador Retriever", name: "Chocolate")
puppy_fixture(color: "Red", breed: "Golden Retriever", name: "Lacey")
