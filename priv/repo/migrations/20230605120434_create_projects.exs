defmodule Taskee.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :due_date, :utc_datetime
      add :owner_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:projects, [:owner_id])
  end
end
