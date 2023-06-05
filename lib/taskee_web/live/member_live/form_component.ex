defmodule TaskeeWeb.MemberLive.FormComponent do
  use TaskeeWeb, :live_component

  alias Taskee.Projects

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage member records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="member-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:role_id]} type="number" label="Role" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Member</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{member: member} = assigns, socket) do
    changeset = Projects.change_member(member)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"member" => member_params}, socket) do
    changeset =
      socket.assigns.member
      |> Projects.change_member(member_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"member" => member_params}, socket) do
    save_member(socket, socket.assigns.action, member_params)
  end

  defp save_member(socket, :edit, member_params) do
    case Projects.update_member(socket.assigns.member, member_params) do
      {:ok, member} ->
        notify_parent({:saved, member})

        {:noreply,
         socket
         |> put_flash(:info, "Member updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_member(socket, :new, member_params) do
    case Projects.create_member(member_params) do
      {:ok, member} ->
        notify_parent({:saved, member})

        {:noreply,
         socket
         |> put_flash(:info, "Member created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
