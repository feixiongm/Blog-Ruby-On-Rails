class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true, length: {maximum: 200 }
  validates :body, presence: true, length:{ minimum: 1 }

  belongs_to :category

  after_create :update_total_posts_count

  scope :active, -> { where( active: true) }
  scope :order_by_latest_first, -> { order( created_at: :desc )}
  scope :limit_2, -> { limit( 2 ) }

  private

  def update_total_posts_count
    category.increment(:total_count, 1).save

  end
  # validates :active, in: [ true, false ]
  # validates :terms_of_service, acceptance: true
  # validates :rating, numericality: { only_integer: true }
  # belongs_to :user
  # has_many :comments
  # def details
  #   "This post was created on #{created_at.strftime("%d/%m%Y")}"
  # end
  #
  # def self.total
  #   #return a total number of posts
  #   all.size
  #   #count
  # end

end
