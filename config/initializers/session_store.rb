# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_NovelReaderSystem_session',
  :secret      => '9e26ee80990fb025253b34fe5ea81717dfc75ea2a2e6b3d8a2d844c2e09a8e8bb78c20a7a58ffd5bf527a151a39837e238c6f1eb0db76f4a73854ea8d856af3e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
