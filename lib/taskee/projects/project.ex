defmodule Taskee.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :due_date, :date
    field :name, :string
    belongs_to :owner, Taskee.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :due_date, :owner_id])
    |> validate_required([:name, :description, :due_date, :owner_id])
  end
end
