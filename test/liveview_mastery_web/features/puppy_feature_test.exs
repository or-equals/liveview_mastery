defmodule LiveviewMasteryWeb.PuppyFeatureTest do
  use LiveviewMasteryWeb.FeatureCase, async: true

  alias LiveviewMasteryWeb.Endpoint
  alias LiveviewMasteryWeb.Router.Helpers, as: Routes

  import LiveviewMastery.PuppiesFixtures

  describe "index" do
    test "view puppies", %{session: session} do
      puppy_fixture()
      puppy_fixture()
      puppy_fixture()

      session
      |> visit(Routes.puppy_index_path(Endpoint, :index))
      |> assert_has(Query.css(".puppy", count: 3))
    end

    # test "create a puppy", %{session: session} do
    #   session
    #   |> visit(Routes.puppy_index_path(Endpoint, :new))
    #   |> fill_in(Query.text_field("Name"), with: "Boomerang")
    #   |> fill_in(Query.text_field("Color"), with: "Blonde")
    #   |> fill_in(Query.text_field("Breed"), with: "Labrador Retriever")
    #   |> click(Query.button("Save"))
    #   |> assert_has(Query.css(".alert", text: "Puppy created successfully"))
    # end
  end

  # defp sign_in_user_and_visit_route_index_page(session, user, date) do
  #   session
  #   |> visit(Routes.user_session_path(Endpoint, :new))
  #   |> fill_in(Query.text_field("Email"), with: user.email)
  #   |> fill_in(Query.text_field("Password"), with: user.password)
  #   |> click(Query.button("Log in"))
  #   |> visit(Routes.logged_in_path(Endpoint, :index))
  # end
end
