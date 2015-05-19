class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true

  def should_generate_new_friendly_id?
    true
  end
end
