module Factories
  class Base
    class << self
      TEMPLATE_WORDS = %w(test name hello content rails react tweet rake coffee sleep nigtmare bike car book cake training gym cool random generator).freeze

      protected

      def save_with_broadcast(item, type, channel)
        return unless item.valid?

        item.save!
        ActionCable.server.broadcast channel, content: { type: type, item: item.as_json }
      end
    end
  end
end
