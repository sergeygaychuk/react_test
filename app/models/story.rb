class Story < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true
  validates_associated :articles
end
