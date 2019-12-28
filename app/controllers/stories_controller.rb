class StoriesController < ApplicationController
  before_action :permit_parameters

  def create
    errors = Factories::Story.create(permitted_story)

    render json: { errors: errors }, status: errors.any? ? 400 : 200
  end

  def destroy
    Factories::Story.delete(params[:id])

    render json: {}, status: 200
  end

  def update
    errors = Factories::Story.update(params[:id], permitted_story)

    render json: { errors: errors }, status: errors.any? ? 400 : 200
  end

  def scaffold
    Factories::Story.scaffold

    render json: {}, status: 200
  end

  def search
    render json: { stories: ::Queries::Story.new(permitted_filter).filter.as_json }, status: 200
  end

  private

  def permit_parameters
    params.permit!
  end

  def permitted_story
    params.fetch(:story, {}).permit!.to_hash.symbolize_keys
  end

  def permitted_filter
    params.fetch(:filter, {}).permit!.to_hash.symbolize_keys
  end
end
