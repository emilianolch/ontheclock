# frozen_string_literal: true

class EventsController < ApplicationController
  def save
    event = Event.new(event_params)

    if (event.save)
      head(:ok)
    else
      head(:bad_request)
    end
  end

  private

  def event_params
    params.permit(:employee_id, :timestamp, :kind)
  end
end
