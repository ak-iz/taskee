defmodule Taskee.Projects.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :text, :string
    field :datetime, :utc_datetime
    belongs_to :user, Taskee.Accounts.User
    belongs_to :task, Taskee.Projects.Task

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:text, :datetime, :user_id, :task_id])
    |> validate_required([:text, :datetime, :user_id, :task_id])
  end
end
