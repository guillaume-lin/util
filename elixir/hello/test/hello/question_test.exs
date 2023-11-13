defmodule Hello.QuestionTest do
  use Hello.DataCase

  alias Hello.Question

  describe "question_templates" do
    alias Hello.Question.QuestionTemplate

    import Hello.QuestionFixtures

    @invalid_attrs %{tmpl: nil, formula: nil}

    test "list_question_templates/0 returns all question_templates" do
      question_template = question_template_fixture()
      assert Question.list_question_templates() == [question_template]
    end

    test "get_question_template!/1 returns the question_template with given id" do
      question_template = question_template_fixture()
      assert Question.get_question_template!(question_template.id) == question_template
    end

    test "create_question_template/1 with valid data creates a question_template" do
      valid_attrs = %{tmpl: "some tmpl", formula: "some formula"}

      assert {:ok, %QuestionTemplate{} = question_template} = Question.create_question_template(valid_attrs)
      assert question_template.tmpl == "some tmpl"
      assert question_template.formula == "some formula"
    end

    test "create_question_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Question.create_question_template(@invalid_attrs)
    end

    test "update_question_template/2 with valid data updates the question_template" do
      question_template = question_template_fixture()
      update_attrs = %{tmpl: "some updated tmpl", formula: "some updated formula"}

      assert {:ok, %QuestionTemplate{} = question_template} = Question.update_question_template(question_template, update_attrs)
      assert question_template.tmpl == "some updated tmpl"
      assert question_template.formula == "some updated formula"
    end

    test "update_question_template/2 with invalid data returns error changeset" do
      question_template = question_template_fixture()
      assert {:error, %Ecto.Changeset{}} = Question.update_question_template(question_template, @invalid_attrs)
      assert question_template == Question.get_question_template!(question_template.id)
    end

    test "delete_question_template/1 deletes the question_template" do
      question_template = question_template_fixture()
      assert {:ok, %QuestionTemplate{}} = Question.delete_question_template(question_template)
      assert_raise Ecto.NoResultsError, fn -> Question.get_question_template!(question_template.id) end
    end

    test "change_question_template/1 returns a question_template changeset" do
      question_template = question_template_fixture()
      assert %Ecto.Changeset{} = Question.change_question_template(question_template)
    end
  end
end
