# frozen_string_literal: true

class Event < ApplicationRecord
  enum kind: { in: 1, out: 2}

  validates :employee_id, presence: true
  validates :timestamp, presence: true
  validates :kind, presence: true

  def date
    timestamp.to_date
  end
end
