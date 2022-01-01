require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  current_user = FactoryBot.create(:user)
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'priority' => 5,
      'user' => current_user
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => 1,
      'priority' => "4"
    }
  end

  let(:sorted_attributes) do
    [
      {
        'title' => 'abc',
        'priority' => 5,
        'user_id' => current_user.id
      },
      {
        'title' => 'efg',
        'priority' => 6,
        'user_id' => current_user.id
      },
    ]
  end

  let(:unsorted_attributes) do
    [
      {
        'title' => 'efg',
        'priority' => 6,
        'user_id' => current_user.id
      },
      {
        'title' => 'abc',
        'priority' => 5,
        'user_id' => current_user.id
      }
    ]
  end

  describe 'GET /index' do
    context 'filter result' do
      it 'renders a successful response' do
        sign_in current_user
        task = Task.new(valid_attributes)
        task.save
        get tasks_url
        expect(response).to be_successful
      end

      it 'filters by title' do
        sign_in current_user
        task = Task.new(valid_attributes)
        task.save
        get tasks_path(:query => "tes", :priority => 2, :priority_op => "<"), params: { task: valid_attributes }
        expect(response.body).to include("There are no tasks matching your criteria")
      end
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in current_user
      get new_task_path
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Task' do
        expect do
          task = Task.new(valid_attributes)
          task.save
          post tasks_path, params: { task: valid_attributes }
        end.to change(Task, :count).by(1)
      end

      it 'redirects to the created task' do
        sign_in current_user
        post tasks_path, params: { task: valid_attributes }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Task' do
        expect do
          post tasks_path, params: { task: invalid_attributes }
        end.to change(Task, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested task' do
      sign_in current_user
      task = Task.new(valid_attributes)
      task.save
      expect do
        delete task_url(task)
      end.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      sign_in current_user
      task = Task.new(valid_attributes)
      task.save
      delete task_url(task)
      expect(response).to redirect_to(tasks_path)
    end
  end

  describe 'GET /sorted' do
    context 'sort by title' do
      it 'sort by title ascending' do
        sign_in current_user
        unsorted_attributes.map do |item|
          task = Task.new(item)
          task.save
        end
        get sort_tasks_path(sort_by: "title", order: "asc")
        arr = []
        @array_of_hashes = controller.instance_variable_get(:@tasks).to_a.map(&:serializable_hash)
        @array_of_hashes.each do |ele|
          hash = {"title" => ele["title"], "priority" => ele["priority"], "user_id" => ele["user_id"]}
          arr << hash
        end
        expect(arr).to have_same_order(sorted_attributes)
      end

      it 'sort by title descending' do
        sign_in current_user
        unsorted_attributes.map do |item|
          task = Task.new(item)
          task.save
        end
        get sort_tasks_path(sort_by: "title", order: "desc")
        arr = []
        @array_of_hashes = controller.instance_variable_get(:@tasks).to_a.map(&:serializable_hash)
        @array_of_hashes.each do |ele|
          hash = {"title" => ele["title"], "priority" => ele["priority"], "user_id" => ele["user_id"]}
          arr << hash
        end
        expect(arr).not_to have_same_order(sorted_attributes)
      end
    end

    context 'sort by priority' do
      it 'sort by priority ascending' do
        sign_in current_user
        unsorted_attributes.map do |item|
          task = Task.new(item)
          task.save
        end
        get sort_tasks_path(sort_by: "priority", order: "asc")
        arr = []
        @array_of_hashes = controller.instance_variable_get(:@tasks).to_a.map(&:serializable_hash)
        @array_of_hashes.each do |ele|
          hash = {"title" => ele["title"], "priority" => ele["priority"], "user_id" => ele["user_id"]}
          arr << hash
        end
        expect(arr).to have_same_order(sorted_attributes)
      end

      it 'sort by priority descending' do
        sign_in current_user
        unsorted_attributes.map do |item|
          task = Task.new(item)
          task.save
        end
        get sort_tasks_path(sort_by: "priority", order: "desc")
        arr = []
        @array_of_hashes = controller.instance_variable_get(:@tasks).to_a.map(&:serializable_hash)
        @array_of_hashes.each do |ele|
          hash = {"title" => ele["title"], "priority" => ele["priority"], "user_id" => ele["user_id"]}
          arr << hash
        end
        expect(arr).not_to have_same_order(sorted_attributes)
      end
    end
  end
end
