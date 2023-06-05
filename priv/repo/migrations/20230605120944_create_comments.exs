defmodule Taskee.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :text, :string
      add :user, references(:users, on_delete: :delete_all)
      add :task, references(:tasks, on_delete: :delete_all)

      timestamps()
    end

    create index(:comments, [:user])
    create index(:comments, [:task])
  end
end
