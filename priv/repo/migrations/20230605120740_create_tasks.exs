defmodule Taskee.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :due_date, :date
      add :is_completed, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all)
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps()
    end

    create index(:tasks, [:user_id])
    create index(:tasks, [:project_id])
  end
end
