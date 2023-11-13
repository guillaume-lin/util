defmodule HelloWeb.PaperHTML do
  use HelloWeb, :html

  embed_templates "paper_html/*"

  @doc """
  Renders a paper form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def paper_form(assigns)
end
