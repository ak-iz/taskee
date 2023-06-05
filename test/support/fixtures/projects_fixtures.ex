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
        due_date: ~U[2023-06-04 12:04:00Z],
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
        description: "some description",
        due_date: ~U[2023-06-04 12:07:00Z],
        is_completed: true,
        name: "some name"
      })
      |> Taskee.Projects.create_task()

    task
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        text: "some text"
      })
      |> Taskee.Projects.create_comment()

    comment
  end
end
