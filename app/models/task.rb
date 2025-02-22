class Task < ApplicationRecord
  validates :status, inclusion: { in: %w[pending done] }
end
