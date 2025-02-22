class Task < ApplicationRecord
  # validates :status, inclusion: { in: %w[pending done] }
  belongs_to :user
end
