defmodule Taskee.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :text, :string
      add :user_id, references(:user, on_delete: :nothing)
      add :task_id, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user_id])
    create index(:comments, [:task_id])
  end
end
