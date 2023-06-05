defmodule Taskee.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :role_id, :integer
      add :user, references(:user, on_delete: :nothing)
      add :project, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:members, [:user])
    create index(:members, [:project])
  end
end
