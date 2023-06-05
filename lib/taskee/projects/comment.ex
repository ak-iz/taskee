defmodule Taskee.Projects.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :text, :string
    field :user, :id
    field :task, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
