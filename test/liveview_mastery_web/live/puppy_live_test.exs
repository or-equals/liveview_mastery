defmodule LiveviewMasteryWeb.PuppyLiveTest do
  use LiveviewMasteryWeb.ConnCase

  import Phoenix.LiveViewTest
  import LiveviewMastery.PuppiesFixtures

  @create_attrs %{breed: "some breed", name: "some name", photo_url: "some photo_url"}
  @update_attrs %{breed: "some updated breed", name: "some updated name", photo_url: "some updated photo_url"}
  @invalid_attrs %{breed: nil, name: nil, photo_url: nil}

  defp create_puppy(_) do
    puppy = puppy_fixture()
    %{puppy: puppy}
  end

  describe "Index" do
    setup [:create_puppy]

    test "lists all puppies", %{conn: conn, puppy: puppy} do
      {:ok, _index_live, html} = live(conn, Routes.puppy_index_path(conn, :index))

      assert html =~ "Listing Puppies"
      assert html =~ puppy.breed
    end

    test "saves new puppy", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.puppy_index_path(conn, :index))

      assert index_live |> element("a", "New Puppy") |> render_click() =~
               "New Puppy"

      assert_patch(index_live, Routes.puppy_index_path(conn, :new))

      assert index_live
             |> form("#puppy-form", puppy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#puppy-form", puppy: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.puppy_index_path(conn, :index))

      assert html =~ "Puppy created successfully"
      assert html =~ "some breed"
    end

    test "updates puppy in listing", %{conn: conn, puppy: puppy} do
      {:ok, index_live, _html} = live(conn, Routes.puppy_index_path(conn, :index))

      assert index_live |> element("#puppy-#{puppy.id} a", "Edit") |> render_click() =~
               "Edit Puppy"

      assert_patch(index_live, Routes.puppy_index_path(conn, :edit, puppy))

      assert index_live
             |> form("#puppy-form", puppy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#puppy-form", puppy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.puppy_index_path(conn, :index))

      assert html =~ "Puppy updated successfully"
      assert html =~ "some updated breed"
    end

    test "deletes puppy in listing", %{conn: conn, puppy: puppy} do
      {:ok, index_live, _html} = live(conn, Routes.puppy_index_path(conn, :index))

      assert index_live |> element("#puppy-#{puppy.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#puppy-#{puppy.id}")
    end
  end

  describe "Show" do
    setup [:create_puppy]

    test "displays puppy", %{conn: conn, puppy: puppy} do
      {:ok, _show_live, html} = live(conn, Routes.puppy_show_path(conn, :show, puppy))

      assert html =~ "Show Puppy"
      assert html =~ puppy.breed
    end

    test "updates puppy within modal", %{conn: conn, puppy: puppy} do
      {:ok, show_live, _html} = live(conn, Routes.puppy_show_path(conn, :show, puppy))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Puppy"

      assert_patch(show_live, Routes.puppy_show_path(conn, :edit, puppy))

      assert show_live
             |> form("#puppy-form", puppy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#puppy-form", puppy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.puppy_show_path(conn, :show, puppy))

      assert html =~ "Puppy updated successfully"
      assert html =~ "some updated breed"
    end
  end
end
