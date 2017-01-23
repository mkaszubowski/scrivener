defmodule Scrivener.Repo do
  use EctoOne.Repo, otp_app: :scrivener
  use Scrivener, page_size: 5, max_page_size: 10
end
