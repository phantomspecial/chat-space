class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  # accepts_nested_attributes_for :group_users

  has_many :messages

  validates :name, presence: true

  class << self
    def last_message_show(group)
      if group.messages.last.try(:content).present?
        return group.messages.last.content
      elsif group.messages.last.try(:image).present?
        return "画像が投稿されています"
      else
        return "まだメッセージはありません"
      end
    end
  end

end
