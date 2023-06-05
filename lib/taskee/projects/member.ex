defmodule Taskee.Projects.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :role_id, :integer
    field :user, :id
    field :project, :id

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:role_id])
    |> validate_required([:role_id])
  end
end
