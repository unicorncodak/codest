class Task < ApplicationRecord
  ORDER = "asc"
  include Filterable
  belongs_to :user

  validates :title, presence: true
  validates :priority, presence: true
  scope :filter_by_query, -> (op = nil, title) { where("title like ?", "#{title}%") }
  scope :filter_by_priority, -> (op, priority) {
    case op
    when ">"
      where("priority > ? ", "#{priority}")
    when "<"
      where("priority < ? ", "#{priority}")
    else
      where("priority = ? ", "#{priority}")
    end
  }

  def self.sort(params, current_user)
    params[:sort_by] == "title" ? @tasks = current_user.tasks.order(title: params[:order].to_sym) :
      @tasks = current_user.tasks.order(priority: params[:order].to_sym)
  end
end
