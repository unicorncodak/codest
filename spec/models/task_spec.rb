require 'rails_helper'

RSpec.describe Task, type: :model do
  describe ' Model.Task' do
    before(:all) do
      @user = FactoryBot.create(:user)
    end

    let(:task) { FactoryBot.create(:task, title: "demo", priority: 2, user: @user) }

    context 'validates field using fixtures' do
      it 'attributes must be valid' do
        expect(task).to be_valid
      end

      it 'title must not be valid' do
        task.title = nil
        expect(task).not_to be_valid
      end

      it 'priority must not be valid' do
        task.priority = nil
        expect(task).not_to be_valid
      end
    end
  end
end
