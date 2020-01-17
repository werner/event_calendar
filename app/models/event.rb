class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validate  :end_date_bigger_than_start_date

  private

  def end_date_bigger_than_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'must be bigger than start date')
    end
  end
end
