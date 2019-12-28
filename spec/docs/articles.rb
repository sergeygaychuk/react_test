module Docs
  module Articles
    extend Dox::DSL::Syntax

    document :api do
      resource "Articles" do
        endpoint "/articles"
        group "Articles"
        desc "articles.md"
      end
    end

    show_params = { id: { type: :number, required: :required, value: 1, description: 'article id' } }
    document :show do
      action 'Get article' do
        path '/articles/{id}'
        verb 'GET'
        params show_params
      end
    end

    create_params = {
      name: { type: :string, required: :required, value: 'test', description: 'article name' },
      story_id: { type: :number, required: :required, value: 1, description: 'story id that article belongs to' },
      content: { type: :text, required: :required, value: 'test', description: 'article content' },
      source: { type: :enum, required: :required, value: 'facebook', description: "article source, possible values ['blog', 'facebook', 'tweet', 'other']" }
    }
    document :create do
      action 'Create article' do
        path '/articles'
        verb 'POST'
        params create_params
      end
    end

    document :destroy do
      action 'Destroy article' do
        path '/articles/{id}'
        verb 'DELETE'
        params show_params
      end
    end

    update_params = {
      name: { type: :string, required: :required, value: 'test', description: 'article name' },
      story_id: { type: :number, required: :required, value: 1, description: 'story id that article belongs to' },
      content: { type: :text, required: :required, value: 'test', description: 'article content' },
      source: { type: :enum, required: :required, value: 'facebook', description: "article source, possible values ['blog', 'facebook', 'tweet', 'other']" }
    }
    document :update do
      action 'Update article' do
        path '/articles/{id}'
        verb 'PUT'
        params update_params
      end
    end

    scaffold_params = { story_id: { type: :number, required: :required, value: 1, description: 'story id that article belongs to' } }
    document :scaffold do
      action 'Scaffold article' do
        path '/articles/scaffold'
        verb 'POST'
        params scaffold_params
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
        path '/articles/search'
        verb 'GET'
        params search_params
      end
    end

    document :group do
      action 'Apply group clause' do
        path '/articles/group'
        verb 'GET'
        params search_params
      end
    end

    document :count do
      action 'Apply count clause' do
        path '/articles/count'
        verb 'GET'
        params search_params
      end
    end
  end
end
