require_relative '../validators/url_validator'

class Post < ActiveRecord::Base
  belongs_to :user

  validates(:name,
            presence: true,
            length: { minimum: 5 },
            uniqueness: { case_sensitive: false })

  validates(:url,
            presence: true,
            url: true)

  validates_presence_of :user
end
