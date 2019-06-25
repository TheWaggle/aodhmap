defmodule Aodhmap.Repo do
  use Ecto.Repo,
    otp_app: :aodhmap,
    adapter: Ecto.Adapters.Postgres
end
