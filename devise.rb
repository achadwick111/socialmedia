Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  config.secret_key = '##############'
require 'omniauth-linkedin'
config.omniauth :linkedin,  "################", "##############"


require 'omniauth-twitter'
config.omniauth :twitter, "################", "##############"

end