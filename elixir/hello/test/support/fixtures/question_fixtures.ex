defmodule Hello.QuestionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Question` context.
  """

  @doc """
  Generate a question_template.
  """
  def question_template_fixture(attrs \\ %{}) do
    {:ok, question_template} =
      attrs
      |> Enum.into(%{
        formula: "some formula",
        tmpl: "some tmpl"
      })
      |> Hello.Question.create_question_template()

    question_template
  end
end
