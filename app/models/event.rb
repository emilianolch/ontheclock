# frozen_string_literal: true

# An event of an employee entering or leaving the office.
class Event < ApplicationRecord
  enum kind: { in: 0, out: 1 }

  validates :employee_id, presence: true
  validates :timestamp, presence: true
  validates :kind, presence: true

  def date
    timestamp.to_date
  end

  def timestamp=(value)
    super(Time.zone.at(value.to_i))
  end
end
