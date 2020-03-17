require_relative '../validators/email_validator'

class User < ActiveRecord::Base
  has_many :posts

  validates(:username,
            presence: true,
            uniqueness: true)

  validates(:email,
            presence: true,
            uniqueness: true,
            email: true)

  before_validation :strip_email

  private

  def strip_email
    email&.strip!
  end
end
