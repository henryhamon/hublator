# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cooldwarf_session',
  :secret      => 'ad7d34c8837a67adce1773d43fa513f951cbbeb0993f57e90e94168894dfdfc8fdb108cceac870dd1b8309cbf74e4d446ad55048d97e87f245fd2c7b57ade603'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
