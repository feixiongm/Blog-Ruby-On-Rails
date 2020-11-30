class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true, length: {maximum: 200 }
  validates :body, presence: true, length:{ minimum: 1 }
  # validates :active, in: [ true, false ]
  # validates :terms_of_service, acceptance: true
  # validates :rating, numericality: { only_integer: true }

  def details
    "This post was created on #{created_at.strftime("%d/%m%Y")}"
  end

  def self.total
    #return a total number of posts
    count
  end

end
