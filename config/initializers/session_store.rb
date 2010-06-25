# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_www.beilabs.com_session',
  :secret      => '1d4253b94bfa14c8d2e8c1e8462a678462af62c113eefdfe72feab33a68a769a6d27c57f37b2ece16c339c5fda78caea70ad8f2cb676d99a17e11f63c531bf89'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
