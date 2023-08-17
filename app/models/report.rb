# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  attr_accessor :from, :to, :employee_id, :worktime_hrs, :problematic_dates

  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true
  validate :date_range

  def initialize(from:, to:, employee_id:)
    @from = Date.new(from)
    @to = Date.new(to)
    @employee_id = employee_id
    @worktime_hrs = 0.0
    @problematic_dates = []
  end
  # TODO: represents the actual report, validate data and implement report methods

  private

  def date_range
    errors.add(:date_range, :invalid) if from > to
  end
end
