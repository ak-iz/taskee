defmodule Taskee.ProjectsTest do
  use Taskee.DataCase

  alias Taskee.Projects

  describe "projects" do
    alias Taskee.Projects.Project

    import Taskee.ProjectsFixtures

    @invalid_attrs %{description: nil, due_date: nil, name: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", due_date: ~U[2023-06-04 11:37:00Z], name: "some name"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.due_date == ~U[2023-06-04 11:37:00Z]
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", due_date: ~U[2023-06-05 11:37:00Z], name: "some updated name"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.due_date == ~U[2023-06-05 11:37:00Z]
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "tasks" do
    alias Taskee.Projects.Task

    import Taskee.ProjectsFixtures

    @invalid_attrs %{completed: nil, description: nil, due_date: nil, name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Projects.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Projects.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{completed: true, description: "some description", due_date: ~U[2023-06-04 11:51:00Z], name: "some name"}

      assert {:ok, %Task{} = task} = Projects.create_task(valid_attrs)
      assert task.completed == true
      assert task.description == "some description"
      assert task.due_date == ~U[2023-06-04 11:51:00Z]
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{completed: false, description: "some updated description", due_date: ~U[2023-06-05 11:51:00Z], name: "some updated name"}

      assert {:ok, %Task{} = task} = Projects.update_task(task, update_attrs)
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.due_date == ~U[2023-06-05 11:51:00Z]
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_task(task, @invalid_attrs)
      assert task == Projects.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Projects.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Projects.change_task(task)
    end
  end
end
