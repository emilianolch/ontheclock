# frozen_string_literal: true

class Event < ApplicationRecord
  enum kind: [:in, :out]

  validates :employee_id, presence: true
  validates :timestamp, presence: true
  validates :kind, presence: true

  def timestamp=(unix)
    self.timestamp = Time.new(unix)
  end
  
  def date
    timestamp.to_date
  end
end
