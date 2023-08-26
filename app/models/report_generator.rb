# frozen_string_literal: true

# Generates a report for an employee between two dates.
class ReportGenerator
  def self.create_report(params)
    report = Report.new(**params)

    report if report.present? && report.valid?
  rescue ArgumentError
    nil
  end
end
