defmodule Hello.Question do
  @moduledoc """
  The Question context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Question.QuestionTemplate

  @doc """
  Returns the list of question_templates.

  ## Examples

      iex> list_question_templates()
      [%QuestionTemplate{}, ...]

  """
  def list_question_templates do
    Repo.all(QuestionTemplate)
  end

  @doc """
  Gets a single question_template.

  Raises `Ecto.NoResultsError` if the Question template does not exist.

  ## Examples

      iex> get_question_template!(123)
      %QuestionTemplate{}

      iex> get_question_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question_template!(id), do: Repo.get!(QuestionTemplate, id)

  @doc """
  Creates a question_template.

  ## Examples

      iex> create_question_template(%{field: value})
      {:ok, %QuestionTemplate{}}

      iex> create_question_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question_template(attrs \\ %{}) do
    %QuestionTemplate{}
    |> QuestionTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question_template.

  ## Examples

      iex> update_question_template(question_template, %{field: new_value})
      {:ok, %QuestionTemplate{}}

      iex> update_question_template(question_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question_template(%QuestionTemplate{} = question_template, attrs) do
    question_template
    |> QuestionTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question_template.

  ## Examples

      iex> delete_question_template(question_template)
      {:ok, %QuestionTemplate{}}

      iex> delete_question_template(question_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question_template(%QuestionTemplate{} = question_template) do
    Repo.delete(question_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question_template changes.

  ## Examples

      iex> change_question_template(question_template)
      %Ecto.Changeset{data: %QuestionTemplate{}}

  """
  def change_question_template(%QuestionTemplate{} = question_template, attrs \\ %{}) do
    QuestionTemplate.changeset(question_template, attrs)
  end
end
