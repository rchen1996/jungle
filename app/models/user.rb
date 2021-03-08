class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email_stripped = email.strip
    @user = User.find_by email: email_stripped

    if !@user
      nil
    else
      authenticate = @user.authenticate(password)

      authenticate ? @user : nil
    end
  end
end
