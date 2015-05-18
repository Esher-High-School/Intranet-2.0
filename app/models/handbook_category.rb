class HandbookCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  has_many :handbook_documents,
         dependent: :destroy
end
