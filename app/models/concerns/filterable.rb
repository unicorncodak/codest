module Filterable
  extend ActiveSupport::Concern
  module ClassMethods
    def filter_result(filter_params, priority_op = nil, data)
      filter_params.each do |key, value|
        data = data.public_send("filter_by_#{key}", priority_op, value) if value.present?
      end
      data
    end
  end
end