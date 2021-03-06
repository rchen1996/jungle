class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  before_save { self.email = email.strip.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email_stripped = email.strip.downcase
    @user = User.where

    @user = User.find_by email: email_stripped

    if !@user
      nil
    else
      authenticate = @user.authenticate(password)

      authenticate ? @user : nil
    end
  end
end
