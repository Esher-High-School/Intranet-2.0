class HandbookDocument < ActiveRecord::Base
  belongs_to :handbook_category
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
end
