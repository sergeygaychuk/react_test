module Factories
  class Article < Base
    class << self
      def create(story_id: nil, name: nil, content: nil, source: nil)
        article = ::Article.new(name: name, story_id: story_id, content: content, source: source)

        save_with_broadcast(article, :create, channel)

        article.errors.full_messages
      end

      def update(article_id, attributes = {})
        article = ::Article.where(id: article_id).first

        return ["No article found with id=#{article_id}"] unless article

        article.assign_attributes(attributes.slice(:name, :content, :source))
        save_with_broadcast(article, :update, channel)

        article.errors.full_messages
      end

      def delete(article_id)
        ::Article.where(id: article_id).destroy_all
        ActionCable.server.broadcast channel, content: { type: :delete, item_id: article_id }
      end

      def scaffold(story_id)
        last_article_id = ::Article.last.try(:id).to_i + 1
        article = ::Article.new(name: "#{TEMPLATE_WORDS.sample(3).join(' ')} #{last_article_id}",
                                story_id: story_id,
                                content: "#{TEMPLATE_WORDS.sample(7).join(' ')} #{last_article_id}",
                                source: ::Article.sources.values.sample)
        save_with_broadcast(article, :create, channel)
      end

      private

      def channel
        'ArticlesChannel'
      end
    end
  end
end
