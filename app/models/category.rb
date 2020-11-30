class Category < ApplicationRecord
  validates_presence_of :title, :url
end
