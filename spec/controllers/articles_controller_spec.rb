require 'rails_helper'

describe ArticlesController, type: :controller do
  include Docs::Articles::Api

  describe 'GET #articles/:id' do
    include Docs::Articles::Show

    it 'returns article', :dox do
      article = create(:article)
      get :show, params: { id: article.id }

      expect(response).to have_http_status(200)
    end

    it 'returns empty response', :dox do
      get :show, params: { id: 15 }

      expect(response.status).to eq(500)
    end
  end

  describe 'POST #articles' do
    include Docs::Articles::Create

    let(:story) { create(:story) }

    it 'creates article', :dox do
      params = build(:article, story: story).as_json.symbolize_keys.except(:created_at, :updated_at, :id)
      post :create, params: { article: params }

      expect(response).to have_http_status(200)
    end

    %i(name story_id content source).each do |key|
      it "returns errors if validations fails (missing #{key}", :dox do
        params = build(:article, story: story).as_json.symbolize_keys.except(key, :created_at, :updated_at, :id)
        post :create, params: { article: params }

        expect(response.status).to eq(400)
      end
    end
  end

  describe 'DELETE #articles/:id' do
    include Docs::Articles::Destroy

    it 'returns article', :dox do
      article = create(:article)
      delete :destroy, params: { id: article.id }

      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT #articles' do
    include Docs::Articles::Update

    let(:story) { create(:story) }

    it 'updates article', :dox do
      article = create(:article, story: story)
      params = article.as_json.symbolize_keys.except(:created_at, :updated_at, :id)
      put :create, params: { id: article.id, article: params }

      expect(response).to have_http_status(200)
    end

    %i(name story_id content source).each do |key|
      it "returns errors if validations fails (missing #{key}", :dox do
        article = create(:article, story: story)
        params = article.as_json.symbolize_keys.except(:created_at, :updated_at, :id)
        params[key] = nil
        put :create, params: { id: article.id, article: params }

        expect(response.status).to eq(400)
      end
    end
  end

  describe 'POST #articles/scaffold' do
    include Docs::Articles::Scaffold

    it 'creates scaffold article', :dox do
      story = create(:story)
      post :scaffold, params: { story_id: story.id }

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #articles/search' do
    include Docs::Articles::Search

    it 'returns article', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :search, params: { story_id: story.id, order: :id }

      expect(response).to have_http_status(200)
    end

    it 'returns articles by condition', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :search, params: { condition: 'other', order: :id }

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #articles/group' do
    include Docs::Articles::Group

    it 'returns article', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :group, params: { story_id: story.id, order: :id, group: :source }

      expect(response).to have_http_status(200)
    end

    it 'returns articles by condition', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :group, params: { condition: 'other', order: :id, group: :source }

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #articles/count' do
    include Docs::Articles::Count

    it 'returns article', :dox do
      story = create(:story)
      create_list(:article, 4, story: story)
      create_list(:article, 2)

      post :count, params: { story_id: story.id, order: :id }

      expect(response).to have_http_status(200)
    end
  end
end
