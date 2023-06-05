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

  describe "comments" do
    alias Taskee.Projects.Comment

    import Taskee.ProjectsFixtures

    @invalid_attrs %{text: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Projects.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Projects.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{text: "some text"}

      assert {:ok, %Comment{} = comment} = Projects.create_comment(valid_attrs)
      assert comment.text == "some text"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{text: "some updated text"}

      assert {:ok, %Comment{} = comment} = Projects.update_comment(comment, update_attrs)
      assert comment.text == "some updated text"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_comment(comment, @invalid_attrs)
      assert comment == Projects.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Projects.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Projects.change_comment(comment)
    end
  end

  describe "members" do
    alias Taskee.Projects.Member

    import Taskee.ProjectsFixtures

    @invalid_attrs %{role_id: nil}

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Projects.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Projects.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      valid_attrs = %{role_id: 42}

      assert {:ok, %Member{} = member} = Projects.create_member(valid_attrs)
      assert member.role_id == 42
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      update_attrs = %{role_id: 43}

      assert {:ok, %Member{} = member} = Projects.update_member(member, update_attrs)
      assert member.role_id == 43
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_member(member, @invalid_attrs)
      assert member == Projects.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Projects.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Projects.change_member(member)
    end
  end
end
