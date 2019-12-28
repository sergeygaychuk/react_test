module Queries
  class Article
    def initialize(story_id: nil, condition: '', group: nil, order: nil)
      @story_id  = story_id
      @condition = condition
      @group_by  = group
      @order     = order
    end

    def count
      build_query.count
    end

    def filter
      build_query
    end

    def group
      @group_by ||= :story_id
      build_query.group_by(&@group_by)
    end

    def group_count
      build_query.unscope(:order).group(:source).count.presence || default_group_count
    end

    def last_created
      build_query.unscope(:order).order(:created_at).last.presence || default_last_article
    end

    def self.find(id)
      ::Article.find(id)
    end

    private

    def default_group_count
      ::Article.sources.keys.each_with_object({}) { |key, result| result[key] = 0 }
    end

    def default_last_article
      ::Article.new.as_json
    end

    def build_query
      @query ||= begin
        query = ::Article.by_name(@condition).or(::Article.by_content(@condition))
        query = query.or(::Article.by_source(@condition)) if apply_source_filter?
        query = query.by_story(@story_id) if apply_story_filter?
        query = query.order(@order) if ordering_required?
        query
      end
    end

    def apply_source_filter?
      ::Article.sources.values.include?(@condition)
    end

    def apply_story_filter?
      @story_id.present?
    end

    def ordering_required?
      @order && ::Article.column_names.include?(@order.to_s.split(' ').first)
    end
  end
end
