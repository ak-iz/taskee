defmodule Taskee.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :due_date, :utc_datetime
      add :is_completed, :boolean, default: false, null: false
      add :user, references(:users, on_delete: :delete_all)
      add :project, references(:projects, on_delete: :delete_all)

      timestamps()
    end

    create index(:tasks, [:user])
    create index(:tasks, [:project])
  end
end
