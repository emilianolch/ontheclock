# frozen_string_literal: true

class ReportGenerator
  attr_reader :report

  def initialize(**params)
    @report = Report.new(params)
  end

  def generate
    return if report.invalid?

    events = Event.where("employee_id = ? AND timestamp >= ? AND timestamp <= ?",
      report.employee_id,
      report.from.beginning_of_day,
      report.to.end_of_day)
  # TODO: - fetch range of events and generate Report
end
