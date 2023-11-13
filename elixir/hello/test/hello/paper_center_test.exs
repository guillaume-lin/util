defmodule Hello.PaperCenterTest do
  use Hello.DataCase

  alias Hello.PaperCenter

  describe "papers" do
    alias Hello.PaperCenter.Paper

    import Hello.PaperCenterFixtures

    @invalid_attrs %{question_tmpl_id: nil}

    test "list_papers/0 returns all papers" do
      paper = paper_fixture()
      assert PaperCenter.list_papers() == [paper]
    end

    test "get_paper!/1 returns the paper with given id" do
      paper = paper_fixture()
      assert PaperCenter.get_paper!(paper.id) == paper
    end

    test "create_paper/1 with valid data creates a paper" do
      valid_attrs = %{question_tmpl_id: 42}

      assert {:ok, %Paper{} = paper} = PaperCenter.create_paper(valid_attrs)
      assert paper.question_tmpl_id == 42
    end

    test "create_paper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PaperCenter.create_paper(@invalid_attrs)
    end

    test "update_paper/2 with valid data updates the paper" do
      paper = paper_fixture()
      update_attrs = %{question_tmpl_id: 43}

      assert {:ok, %Paper{} = paper} = PaperCenter.update_paper(paper, update_attrs)
      assert paper.question_tmpl_id == 43
    end

    test "update_paper/2 with invalid data returns error changeset" do
      paper = paper_fixture()
      assert {:error, %Ecto.Changeset{}} = PaperCenter.update_paper(paper, @invalid_attrs)
      assert paper == PaperCenter.get_paper!(paper.id)
    end

    test "delete_paper/1 deletes the paper" do
      paper = paper_fixture()
      assert {:ok, %Paper{}} = PaperCenter.delete_paper(paper)
      assert_raise Ecto.NoResultsError, fn -> PaperCenter.get_paper!(paper.id) end
    end

    test "change_paper/1 returns a paper changeset" do
      paper = paper_fixture()
      assert %Ecto.Changeset{} = PaperCenter.change_paper(paper)
    end
  end
end
