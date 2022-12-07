defmodule LiveviewMasteryWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
    end
  end

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(LiveviewMastery.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(LiveviewMastery.Repo, {:shared, self()})

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(LiveviewMastery.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end

