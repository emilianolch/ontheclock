# frozen_string_literal: true

class Report
  include ActiveModel::Validations

  validates :from, presence: true
  validates :to, presence: true

  validate
  # TODO: represents the actual report, validate data and implement report methods
end
