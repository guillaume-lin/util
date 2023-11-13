defmodule HelloWeb.PaperControllerTest do
  use HelloWeb.ConnCase

  import Hello.PaperCenterFixtures

  @create_attrs %{question_tmpl_id: 42}
  @update_attrs %{question_tmpl_id: 43}
  @invalid_attrs %{question_tmpl_id: nil}

  describe "index" do
    test "lists all papers", %{conn: conn} do
      conn = get(conn, ~p"/papers")
      assert html_response(conn, 200) =~ "Listing Papers"
    end
  end

  describe "new paper" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/papers/new")
      assert html_response(conn, 200) =~ "New Paper"
    end
  end

  describe "create paper" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/papers", paper: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/papers/#{id}"

      conn = get(conn, ~p"/papers/#{id}")
      assert html_response(conn, 200) =~ "Paper #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/papers", paper: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Paper"
    end
  end

  describe "edit paper" do
    setup [:create_paper]

    test "renders form for editing chosen paper", %{conn: conn, paper: paper} do
      conn = get(conn, ~p"/papers/#{paper}/edit")
      assert html_response(conn, 200) =~ "Edit Paper"
    end
  end

  describe "update paper" do
    setup [:create_paper]

    test "redirects when data is valid", %{conn: conn, paper: paper} do
      conn = put(conn, ~p"/papers/#{paper}", paper: @update_attrs)
      assert redirected_to(conn) == ~p"/papers/#{paper}"

      conn = get(conn, ~p"/papers/#{paper}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, paper: paper} do
      conn = put(conn, ~p"/papers/#{paper}", paper: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Paper"
    end
  end

  describe "delete paper" do
    setup [:create_paper]

    test "deletes chosen paper", %{conn: conn, paper: paper} do
      conn = delete(conn, ~p"/papers/#{paper}")
      assert redirected_to(conn) == ~p"/papers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/papers/#{paper}")
      end
    end
  end

  defp create_paper(_) do
    paper = paper_fixture()
    %{paper: paper}
  end
end
