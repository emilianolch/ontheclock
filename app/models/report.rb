# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  attr_accessor :from, :to, :employee_id, :worktime_hrs, :problematic_dates

  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true
  validate :date_range

  def initialize(from:, to:, employee_id:)
    self.from = from
    self.to = to
    self.employee_id = employee_id
  end
  # TODO: represents the actual report, validate data and implement report methods

  private

  def date_range
    return if from.is_a?(Date) && to.is_a?(Date) && to >= from

    errors.add(:date_range, :invalid)
  end
end
