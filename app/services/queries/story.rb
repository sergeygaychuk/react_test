module Queries
  class Story
    def initialize(story_id: nil, condition: '', order: nil)
      @story_id  = story_id
      @condition = condition
      @order     = order
    end

    def filter
      story_ids = if no_filtering?
                    ::Story.pluck(:id)
                  else
                    @story_id ? Array.wrap(@story_id) : articles_query(nil).filter.unscope(:order).pluck('distinct(story_id)')
                  end

      articles_info = fetch_articles_info(story_ids)

      ::Story.where(id: story_ids).order(order_scope).map do |record|
        info = articles_info[record.id]
        childs = info[:totals].values.sum > 0
        { totals: info[:totals], last_article: info[:last_article], story_id: -1,
          hasItems: childs, type: 'story' }.merge(record.as_json)
      end
    end

    private

    def order_scope
      @order && ::Story.column_names.include?(@order.to_s.split(' ').first) ? @order : :id
    end

    def fetch_articles_info(story_ids)
      story_ids.each_with_object({}) do |story_id, result|
        query = articles_query(story_id)

        result[story_id.to_i] = {
          totals: query.group_count,
          last_article: query.last_created
        }
      end
    end

    def no_filtering?
      (@condition.nil? || @condition.empty?) && (@story_id.nil? || @story_id.to_i == -1)
    end

    def articles_query(story_id)
      ::Queries::Article.new(story_id: story_id, condition: @condition, group: :source, order: @order)
    end
  end
end
