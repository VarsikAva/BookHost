class Message < ApplicationRecord
  validates :sender_id, :receiver_id, :content, presence: true
end
