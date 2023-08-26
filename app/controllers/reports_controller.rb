# frozen_string_literal: true

# Report generator endpoint
class ReportsController < ApplicationController
  def get
    report = ReportGenerator.create_report(report_params)

    if report
      render json: report.to_json
    else
      head(:bad_request)
    end
  end

  private

  def report_params
    params.permit(:from, :to, :employee_id).to_h.symbolize_keys
  end
end
