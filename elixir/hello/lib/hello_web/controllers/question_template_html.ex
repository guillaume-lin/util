defmodule HelloWeb.QuestionTemplateHTML do
  use HelloWeb, :html

  embed_templates "question_template_html/*"

  @doc """
  Renders a question_template form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def question_template_form(assigns)
end
