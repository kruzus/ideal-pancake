defmodule Pots.Repo do
  use Ecto.Repo,
    otp_app: :pots,
    adapter: Ecto.Adapters.Postgres
end
