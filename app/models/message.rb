class Message < ApplicationRecord
	belongs_to :users
	belongs_to :group
end
