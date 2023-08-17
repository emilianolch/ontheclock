# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  attr_accessor :from, :to, :employee_id, :worktime, :problematic_dates

  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true
  validate :date_range

  def initialize(from:, to:, employee_id:)
    @from = Date.new(from)
    @to = Date.new(to)
    @employee_id = employee_id
    @worktime = 0.0
    @problematic_dates = []
  end

  def worktime_hrs
    (worktime / 3600).round(2)
  end

  def to_json
    {
      employee_id:,
      from:,
      to:,
      worktime_hrs:,
      problematic_dates:
    }
  end
  
  private

  def date_range
    errors.add(:date_range, :invalid) if from > to
  end
end
