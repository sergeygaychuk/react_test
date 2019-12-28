module Factories
  class Story < Base
    class << self
      def create(name: nil)
        story = ::Story.new(name: name)

        save_with_broadcast(story, :create, channel)

        story.errors.full_messages
      end

      def update(story_id, name: nil)
        story = ::Story.where(id: story_id).first

        return ["No story found with id=#{story_id}"] unless story
        return ['Name can\'t be blank'] unless name

        story.name = name
        save_with_broadcast(story, :update, channel)
        []
      end

      def delete(story_id)
        ::Story.where(id: story_id).destroy_all
        ActionCable.server.broadcast channel, content: { type: :delete, item_id: story_id }
      end

      def scaffold
        story = ::Story.new(name: "#{TEMPLATE_WORDS.sample(3).join(' ')} #{::Story.last.try(:id).to_i + 1}")
        save_with_broadcast(story, :create, channel)
      end

      private

      def channel
        'StoriesChannel'
      end
    end
  end
end
