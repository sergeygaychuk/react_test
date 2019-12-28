module Docs
  module Stories
    extend Dox::DSL::Syntax

    document :api do
      resource "Stories" do
        endpoint "/stories"
        group "Stories"
        desc "stories.md"
      end
    end

    create_params = { name: { type: :string, required: :required, value: 'test', description: 'article name' } }
    document :create do
      action 'Create story' do
        path '/stories'
        verb 'POST'
        params create_params
      end
    end

    destroy_params = { id: { type: :number, required: :required, value: 1, description: 'story id' } }
    document :destroy do
      action 'Destroy story' do
        path '/stories/{id}'
        verb 'DELETE'
        params destroy_params
      end
    end

    update_params = {
      id: { type: :number, required: :required, value: 1, description: 'story id' },
      name: { type: :string, required: :required, value: 'test', description: 'story name' }
    }
    document :update do
      action 'Update story' do
        path '/stories/{id}'
        verb 'PUT'
        params update_params
      end
    end

    document :scaffold do
      action 'Scaffold story' do
        path '/stories/scaffold'
        verb 'POST'
      end
    end

    search_params = {
      condition: { type: :string, required: :optional, value: 'test', description: 'filtering condition' },
      story_id: { type: :number, required: :optional, value: 1, description: 'story id that article belongs to' },
      group: { type: :string, required: :optional, value: 'name', description: 'field for group clause' },
      order: { type: :string, required: :optional, value: 'status', description: 'field for ordering' }
    }
    document :search do
      action 'Apply filtering' do
        path '/stories/search'
        verb 'GET'
        params search_params
      end
    end
  end
end
