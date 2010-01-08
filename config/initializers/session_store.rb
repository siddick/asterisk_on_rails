# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aor_session',
  :secret      => '546fb9829db5a0208360dc7e61483dcf5963c37bb25710221601ca430da98eca0b4057f7fce2626cff0317b8c2e5062544bc06583a99e526a12a0da1968affe8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
