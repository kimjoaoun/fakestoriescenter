defmodule Fsc.Repo do
  use Ecto.Repo,
    otp_app: :fsc,
    adapter: Ecto.Adapters.Postgres
end
