# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, title: 'demo', priority: 2, user: :user) }

  describe 'Task Validation' do
    context 'validates fields' do
      it 'attributes must be valid' do
        expect(task).to be_valid
      end

      it 'expects title to be invalid' do
        task.title = nil
        expect(task).not_to be_valid
      end

      it 'expects priority to be invalid' do
        task.priority = nil
        expect(task).not_to be_valid
      end
    end
  end
end
