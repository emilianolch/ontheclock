# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: implement report generation endpoint - it should delegate to ReportGenerator
  def get
    report = ReportGenerator.new(report_params).generate

    if report
      render json: report
    else
      head(:bad_request)
    end
  end

  private

  def report_params
    params.permit(:from, :to, :employee_id)
  end
end
