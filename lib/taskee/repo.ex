defmodule Taskee.Repo do
  use Ecto.Repo,
    otp_app: :taskee,
    adapter: Ecto.Adapters.Postgres
end
