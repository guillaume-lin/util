defmodule HelloWeb.PaperController do
  use HelloWeb, :controller

  alias Hello.PaperCenter
  alias Hello.PaperCenter.Paper

  def index(conn, _params) do
    papers = PaperCenter.list_papers()
    render(conn, :index, papers: papers)
  end

  def new(conn, _params) do
    changeset = PaperCenter.change_paper(%Paper{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"paper" => paper_params}) do
    case PaperCenter.create_paper(paper_params) do
      {:ok, paper} ->
        conn
        |> put_flash(:info, "Paper created successfully.")
        |> redirect(to: ~p"/papers/#{paper}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paper = PaperCenter.get_paper!(id)
    render(conn, :show, paper: paper)
  end

  def edit(conn, %{"id" => id}) do
    paper = PaperCenter.get_paper!(id)
    changeset = PaperCenter.change_paper(paper)
    render(conn, :edit, paper: paper, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paper" => paper_params}) do
    paper = PaperCenter.get_paper!(id)

    case PaperCenter.update_paper(paper, paper_params) do
      {:ok, paper} ->
        conn
        |> put_flash(:info, "Paper updated successfully.")
        |> redirect(to: ~p"/papers/#{paper}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, paper: paper, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paper = PaperCenter.get_paper!(id)
    {:ok, _paper} = PaperCenter.delete_paper(paper)

    conn
    |> put_flash(:info, "Paper deleted successfully.")
    |> redirect(to: ~p"/papers")
  end
end
