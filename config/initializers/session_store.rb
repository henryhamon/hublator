# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_studjaro_session',
  :secret      => 'bcb82495f50a335629136accb4b52bc198a53c0ed1c96aeef263edb2259a93cebead27bd0e53fcb092d86deb19170dd5f17af968a6176c2f0069dbb163ee2be1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
