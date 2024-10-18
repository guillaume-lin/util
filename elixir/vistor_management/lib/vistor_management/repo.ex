defmodule VistorManagement.Repo do
  use AshPostgres.Repo,
    otp_app: :vistor_management

  def installed_extensions do
    # Add extensions here, and the migration generator will install them.
    ["ash-functions", "citext"]
  end

  def min_pg_version do
    %Version{major: 14, minor: 13, patch: 0}
  end
end
