defmodule Hello.PaperCenterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.PaperCenter` context.
  """

  @doc """
  Generate a paper.
  """
  def paper_fixture(attrs \\ %{}) do
    {:ok, paper} =
      attrs
      |> Enum.into(%{
        question_tmpl_id: 42
      })
      |> Hello.PaperCenter.create_paper()

    paper
  end
end
