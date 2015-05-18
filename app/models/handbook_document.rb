class HandbookDocument < ActiveRecord::Base
  belongs_to :handbook_category
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true

  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }
end
