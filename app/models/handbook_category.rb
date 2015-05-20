class HandbookCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    true
  end
  order 'title ASC'
  validates :title, presence: true
  has_many :handbook_documents, -> { order 'title ASC' },
         dependent: :destroy
end
