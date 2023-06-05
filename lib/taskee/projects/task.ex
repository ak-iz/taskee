defmodule Taskee.Projects.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :due_date, :date
    field :is_completed, :boolean, default: false
    field :name, :string
    belongs_to :user, Taskee.Accounts.User
    belongs_to :project, Taskee.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :due_date, :is_completed])
    |> validate_required([:name, :description, :due_date])
  end
end
