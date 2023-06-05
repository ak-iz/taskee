defmodule Taskee.Projects.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :due_date, :utc_datetime
    field :is_completed, :boolean, default: false
    field :name, :string
    field :user, :id
    field :project, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :due_date, :is_completed])
    |> validate_required([:name, :description, :due_date, :is_completed])
  end
end
