# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existing token.
    File.read(token_file).chomp
  else
    #Generate a new token and store it in token_file
    token = SecureRantom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = '09ee1e1f67063d71ee9bf85ab546098f3e08f6bdacbb679bc29c9faf0b2d96e7eb3e69232ffbbe6a2cc0290b7670e31e9ec13c8adc1ce910c4857a82d0001529'
