class TaskFilter < ApplicationService
  def initialize(filter_params, priority_op = nil, data)
    @data = data
    @filter_params = filter_params
    @priority_op = priority_op
  end

  def call
    result = Task.where(nil)
    @filter_params.each do |key, value|
      result = result.public_send("filter_by_#{key}", @priority_op, value) if value.present?
    end
    result
  end
end
