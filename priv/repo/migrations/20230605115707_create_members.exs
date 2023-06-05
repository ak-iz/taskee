defmodule Taskee.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :role_id, :integer
      add :user_id, references(:user, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:members, [:user_id])
    create index(:members, [:project_id])
  end
end
