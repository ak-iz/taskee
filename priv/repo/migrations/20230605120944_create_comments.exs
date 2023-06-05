defmodule Taskee.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :text, :string
      add :user, references(:user, on_delete: :nothing)
      add :task, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user])
    create index(:comments, [:task])
  end
end
