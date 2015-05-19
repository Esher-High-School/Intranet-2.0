class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true

  def should_generate_new_friendly_id?
    true
  end
end
