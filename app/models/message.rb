class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :messagechecker, presence: true

  def messagechecker
    content.presence or image.presence
  end

end
