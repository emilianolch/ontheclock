# frozen_string_literal: true

# Worktime report for an employee between dates.
class Report
  include ActiveModel::Validations

  attr_reader :from, :to, :employee_id

  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :date_range

  def initialize(from:, to:, employee_id:)
    @from = Date.parse(from)
    @to = Date.parse(to)
    @employee_id = employee_id.to_i
  rescue Date::Error
    raise ArgumentError, 'Invalid date'
  end

  def to_json(*_args)
    {
      employee_id:,
      from:,
      to:,
      worktime_hrs: (worktime / 3600).round(2),
      problematic_dates:
    }
  end

  private

  def events_by_date
    Event.where(employee_id:, timestamp: from.beginning_of_day..to.end_of_day)
         .group_by(&:date)
  end

  def valid_dates
    events_by_date.select do |_, events|
      events.map(&:kind) == %w[in out]
    end
  end

  def problematic_dates
    events_by_date.reject do |_, events|
      events.map(&:kind) == %w[in out]
    end.keys
  end

  def worktime
    valid_dates.sum do |_, events|
      events.second.timestamp - events.first.timestamp
    end
  end

  def date_range
    errors.add(:date_range, :invalid) if from > to
  end
end
