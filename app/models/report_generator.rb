# frozen_string_literal: true

class ReportGenerator
  attr_reader :report

  def initialize(in:, out:, employee_id:)
    @report = Report.new(in:, out:, employee_id:)
  end

  def generate
    return if report.invalid?

    events = Event.where("employee_id = ? AND timestamp >= ? AND timestamp <= ?",
      report.employee_id,
      report.from.beginning_of_day,
      report.to.end_of_day)

    events.group_by(&:date) do |day, events|
      if events.length == 2 && event.first.in? && event.second.out?
        report.worktime += (event.second.timestamp - event.first.timestamp)
      else
        report.problematic_dates << day
      end
    end

    report
  end
end
