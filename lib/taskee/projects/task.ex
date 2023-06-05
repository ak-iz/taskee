defmodule Taskee.Projects.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :due_date, :utc_datetime
    field :name, :string
    field :created_by, :id
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :due_date, :completed])
    |> validate_required([:name, :description, :due_date, :completed])
  end
end
