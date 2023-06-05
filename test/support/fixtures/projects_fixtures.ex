defmodule Taskee.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Taskee.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        due_date: ~U[2023-06-04 11:37:00Z],
        name: "some name"
      })
      |> Taskee.Projects.create_project()

    project
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed: true,
        description: "some description",
        due_date: ~U[2023-06-04 11:51:00Z],
        name: "some name"
      })
      |> Taskee.Projects.create_task()

    task
  end
end
