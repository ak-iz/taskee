defmodule Taskee.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :due_date, :utc_datetime
      add :completed, :boolean, default: false, null: false
      add :created_by, references(:users, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:created_by])
    create index(:tasks, [:project_id])
  end
end
