class PageAttachment < ActiveRecord::Base
  belongs_to :page

  validates :title, presence: true
  order 'title ASC'

  has_attached_file :attachment, :default_url => "/file/"
  do_not_validate_attachment_file_type :attachment
end
