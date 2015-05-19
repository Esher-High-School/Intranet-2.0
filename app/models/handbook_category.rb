class HandbookCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  order 'title ASC'
  validates :title, presence: true
  has_many :handbook_documents,
         dependent: :destroy
end
