defmodule Taskee.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :role_id, :integer
      add :user_id, references(:users, on_delete: :delete_all)
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps()
    end

    create index(:members, [:user_id])
    create index(:members, [:project_id])
  end
end
