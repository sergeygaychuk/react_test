class ArticlesController < ApplicationController
  before_action :permit_params

  def create
    errors = ::Factories::Article.create(permitted_article)

    render json: { errors: errors }, status: errors.any? ? 400 : 200
  end

  def show
    article = ::Queries::Article.find(params[:id])
    render json: { article: article.as_json }, status: 200
  end

  def destroy
    ::Factories::Article.delete(params[:id])

    render json: {},  status: 200
  end

  def update
    errors = ::Factories::Article.update(params[:id], permitted_article)

    render json: { errors: errors }, status: errors.any? ? 400 : 200
  end

  def scaffold
    ::Factories::Article.scaffold(params[:story_id])

    render json: {}, status: 200
  end

  def search
    render json: { articles: query.filter.map { |article| article.as_json.merge(type: 'article') } }, status: 200
  end

  def group
    render json: { articles: query.group.as_json }, status: 200
  end

  def count
    render json: { articles_count: query.count }, status: 200
  end

  private

  def query
    ::Queries::Article.new(permitted_filter)
  end

  def permit_params
    params.permit!
  end

  def permitted_article
    params.fetch(:article, {}).permit!.to_hash.symbolize_keys
  end

  def permitted_filter
    params.fetch(:filter, {}).permit!.to_hash.symbolize_keys
  end
end
