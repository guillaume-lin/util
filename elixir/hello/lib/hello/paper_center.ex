defmodule Hello.PaperCenter do
  @moduledoc """
  The PaperCenter context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.PaperCenter.Paper

  @doc """
  Returns the list of papers.

  ## Examples

      iex> list_papers()
      [%Paper{}, ...]

  """
  def list_papers do
    Repo.all(Paper)
  end

  @doc """
  Gets a single paper.

  Raises `Ecto.NoResultsError` if the Paper does not exist.

  ## Examples

      iex> get_paper!(123)
      %Paper{}

      iex> get_paper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_paper!(id), do: Repo.get!(Paper, id)

  @doc """
  Creates a paper.

  ## Examples

      iex> create_paper(%{field: value})
      {:ok, %Paper{}}

      iex> create_paper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_paper(attrs \\ %{}) do
    %Paper{}
    |> Paper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a paper.

  ## Examples

      iex> update_paper(paper, %{field: new_value})
      {:ok, %Paper{}}

      iex> update_paper(paper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_paper(%Paper{} = paper, attrs) do
    paper
    |> Paper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a paper.

  ## Examples

      iex> delete_paper(paper)
      {:ok, %Paper{}}

      iex> delete_paper(paper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_paper(%Paper{} = paper) do
    Repo.delete(paper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking paper changes.

  ## Examples

      iex> change_paper(paper)
      %Ecto.Changeset{data: %Paper{}}

  """
  def change_paper(%Paper{} = paper, attrs \\ %{}) do
    Paper.changeset(paper, attrs)
  end


  @doc """
  Add a question the a paper
  """
  def add_question_to_paper() do

  end
  @doc """
  Show a paper
  """
  def show_paper_with_answsers() do

  end

  @doc """
  export a paper as pdf for print
  """
  def export_paper() do

  end
  @doc """
  Export paper's answer
  """
  def export_paper_answers() do

  end
end
