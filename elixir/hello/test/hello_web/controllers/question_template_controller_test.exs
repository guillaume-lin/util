defmodule HelloWeb.QuestionTemplateControllerTest do
  use HelloWeb.ConnCase

  import Hello.QuestionFixtures

  @create_attrs %{tmpl: "some tmpl", formula: "some formula"}
  @update_attrs %{tmpl: "some updated tmpl", formula: "some updated formula"}
  @invalid_attrs %{tmpl: nil, formula: nil}

  describe "index" do
    test "lists all question_templates", %{conn: conn} do
      conn = get(conn, ~p"/question_templates")
      assert html_response(conn, 200) =~ "Listing Question templates"
    end
  end

  describe "new question_template" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/question_templates/new")
      assert html_response(conn, 200) =~ "New Question template"
    end
  end

  describe "create question_template" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/question_templates", question_template: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/question_templates/#{id}"

      conn = get(conn, ~p"/question_templates/#{id}")
      assert html_response(conn, 200) =~ "Question template #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/question_templates", question_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Question template"
    end
  end

  describe "edit question_template" do
    setup [:create_question_template]

    test "renders form for editing chosen question_template", %{conn: conn, question_template: question_template} do
      conn = get(conn, ~p"/question_templates/#{question_template}/edit")
      assert html_response(conn, 200) =~ "Edit Question template"
    end
  end

  describe "update question_template" do
    setup [:create_question_template]

    test "redirects when data is valid", %{conn: conn, question_template: question_template} do
      conn = put(conn, ~p"/question_templates/#{question_template}", question_template: @update_attrs)
      assert redirected_to(conn) == ~p"/question_templates/#{question_template}"

      conn = get(conn, ~p"/question_templates/#{question_template}")
      assert html_response(conn, 200) =~ "some updated tmpl"
    end

    test "renders errors when data is invalid", %{conn: conn, question_template: question_template} do
      conn = put(conn, ~p"/question_templates/#{question_template}", question_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Question template"
    end
  end

  describe "delete question_template" do
    setup [:create_question_template]

    test "deletes chosen question_template", %{conn: conn, question_template: question_template} do
      conn = delete(conn, ~p"/question_templates/#{question_template}")
      assert redirected_to(conn) == ~p"/question_templates"

      assert_error_sent 404, fn ->
        get(conn, ~p"/question_templates/#{question_template}")
      end
    end
  end

  defp create_question_template(_) do
    question_template = question_template_fixture()
    %{question_template: question_template}
  end
end
