defmodule LiveviewMastery.Repo do
  use Ecto.Repo,
    otp_app: :liveview_mastery,
    adapter: Ecto.Adapters.Postgres
end
