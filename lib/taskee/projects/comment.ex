defmodule Taskee.Projects.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :text, :string
    belongs_to :user, Taskee.Accounts.User
    belongs_to :task, Taskee.Projects.Task

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
