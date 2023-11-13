defmodule HelloWeb.QuestionTemplateController do
  use HelloWeb, :controller

  alias Hello.Question
  alias Hello.Question.QuestionTemplate

  def index(conn, _params) do
    question_templates = Question.list_question_templates()
    render(conn, :index, question_templates: question_templates)
  end

  def new(conn, _params) do
    changeset = Question.change_question_template(%QuestionTemplate{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"question_template" => question_template_params}) do
    case Question.create_question_template(question_template_params) do
      {:ok, question_template} ->
        conn
        |> put_flash(:info, "Question template created successfully.")
        |> redirect(to: ~p"/question_templates/#{question_template}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    question_template = Question.get_question_template!(id)
    render(conn, :show, question_template: question_template)
  end

  def edit(conn, %{"id" => id}) do
    question_template = Question.get_question_template!(id)
    changeset = Question.change_question_template(question_template)
    render(conn, :edit, question_template: question_template, changeset: changeset)
  end

  def update(conn, %{"id" => id, "question_template" => question_template_params}) do
    question_template = Question.get_question_template!(id)

    case Question.update_question_template(question_template, question_template_params) do
      {:ok, question_template} ->
        conn
        |> put_flash(:info, "Question template updated successfully.")
        |> redirect(to: ~p"/question_templates/#{question_template}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, question_template: question_template, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    question_template = Question.get_question_template!(id)
    {:ok, _question_template} = Question.delete_question_template(question_template)

    conn
    |> put_flash(:info, "Question template deleted successfully.")
    |> redirect(to: ~p"/question_templates")
  end
end
