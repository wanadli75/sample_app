# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleApp::Application.config.secret_key_base = '63a0fc52b8e592573625b596ce214d0f607da597506934888e5f1de3bd52e19d5df0027b0761b5a0733ba72a3cb3f89de37a79e8fd6de90d7cb810487ce9c1b3'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
    	# Use the existing token.
    	File.read(token_file).chomp
  	else
    	# Generate a new token and store it in token_file.
	    token = SecureRandom.hex(64)
	    File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token