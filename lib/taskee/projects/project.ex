defmodule Taskee.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :due_date, :utc_datetime
    field :name, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :due_date])
    |> validate_required([:name, :description, :due_date])
  end
end
