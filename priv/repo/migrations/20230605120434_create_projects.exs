defmodule Taskee.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :due_date, :utc_datetime
      add :owner, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:projects, [:owner])
  end
end
