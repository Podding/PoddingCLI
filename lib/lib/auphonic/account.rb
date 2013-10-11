# encoding: utf-8

class Auphonic::Account
  attr_reader :username, :password

  def initialize
   @username = Settings.auphonic_user
   @password = Settings.auphonic_password
  end
end