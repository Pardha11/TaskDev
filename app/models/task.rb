class Task < ApplicationRecord
  validates :status, inclusion: { in: %w[pending taken done] }
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :long_description, presence: true
  belongs_to :user

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
