defmodule Postmodern.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
  otp_app: :postmodern,
  error_handler: Postmodern.Auth.ErrorHandler,
  module: Postmodern.Auth.Guardian

  # If there's a session token, validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}

  # If there is an authorization handler, validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}

  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
