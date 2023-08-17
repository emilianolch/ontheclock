# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  attr_accessor :from, :to, :employee_id, :worktime_hrs, :problematic_dates

  validates :from, presence: true
  validates :to, presence: true
  validates :employee_id, presence: true
  validate :date_range
  # TODO: represents the actual report, validate data and implement report methods

end
