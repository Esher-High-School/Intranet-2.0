class Page < ActiveRecord::Base
  extend FriendlyId
  validates :title, presence: true
  friendly_id :title, use: :slugged
  order 'title ASC'

  has_many :page_attachments,
         dependent: :destroy
  
  has_many :children, -> { order 'title ASC' },
          class_name: "Page",
          foreign_key: "parent_id",
          dependent: :destroy
end
