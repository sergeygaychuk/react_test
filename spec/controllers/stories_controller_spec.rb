require 'rails_helper'

describe StoriesController, type: :controller do
  include Docs::Stories::Api

  describe 'POST #stories' do
    include Docs::Stories::Create

    it 'creates stoy', :dox do
      post :create, params: { story: { name: 'test' } }

      expect(response).to have_http_status(200)
    end

    it "returns errors if validations fails (missing :name", :dox do
      post :create, params: { story: { name: nil } }

      expect(response.status).to eq(400)
    end
  end

  describe 'DELETE #stories/:id' do
    include Docs::Stories::Destroy

    it 'deletes stories', :dox do
      story = create(:story)
      delete :destroy, params: { id: story.id }

      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT #stories' do
    include Docs::Stories::Update

    it 'updates stories', :dox do
      create(:story)
      put :create, params: { story: { name: 'test' } }

      expect(response).to have_http_status(200)
    end

    it "returns errors if validations fails (missing :name)", :dox do
      story = create(:story)
      put :create, params: { id: story.id, story: { name: nil } }

      expect(response.status).to eq(400)
    end
  end

  describe 'POST #stories/scaffold' do
    include Docs::Stories::Scaffold

    it 'creates scaffold story', :dox do
      post :scaffold

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #stories/search' do
    include Docs::Stories::Search

    it 'returns stories by story id', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :search, params: { story_id: story.id, order: :id }

      expect(response).to have_http_status(200)
    end

    it 'returns stories by condition', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :search, params: { condition: 'other', order: :id }

      expect(response).to have_http_status(200)
    end
  end
end
