class Task < ApplicationRecord
  ORDER = 'asc'
  belongs_to :user

  validates :title, presence: true
  validates :priority, presence: true
  scope :filter_by_query, ->(_op = nil, title) { where('title like ?', "#{title}%") }
  scope :filter_by_priority, lambda { |op, priority|
    if ["<",">",">=","<=","="].include? op
      where("priority #{op} ?", priority)
    end
  }

  def self.sort(params, current_user)
    tasks = params[:sort_by] == 'title' ? current_user.tasks.order(title: params[:order].to_sym) :
               current_user.tasks.order(priority: params[:order].to_sym)
    order = params[:order] == 'asc' ? 'desc' : 'asc'
    [tasks, order]
  end
end
