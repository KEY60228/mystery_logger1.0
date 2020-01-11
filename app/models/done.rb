class Done < ApplicationRecord
  validates :performance_id, {presence: true}
  validates :user_id, {presence:true}
end
