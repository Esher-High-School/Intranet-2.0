class Page < ActiveRecord::Base
  extend FriendlyId
  validates :title, presence: true
  friendly_id :title, use: :slugged
  order 'title ASC'

  def should_generate_new_friendly_id?
    true
  end

  has_many :page_attachments, -> { order 'title ASC' },
         dependent: :destroy

  has_many :children, -> { order 'title ASC' },
          class_name: "Page",
          foreign_key: "parent_id",
          dependent: :destroy
end
