# frozen_string_literal: true

# Event registration endpoint.
class EventsController < ApplicationController
  def save
    Event.create!(event_params)
    head(:ok)
  rescue ActiveRecord::RecordInvalid, ArgumentError
    head(:bad_request)
  end

  private

  def event_params
    params.permit(:employee_id, :timestamp, :kind)
  end
end
