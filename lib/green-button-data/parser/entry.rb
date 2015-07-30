module GreenButtonData
  module Parser
    class Entry
      include SAXMachine
      include Utilities

      element :id, as: :entry_id

      def id
        @entry_id ||= @url
      end

      element :link, as: :up, value: :href, with: { rel: 'up' }
      element :link, as: :self, value: :href, with: { rel: 'self' }
      element :link, as: :related, value: :href, with: { rel: 'related' }

      element :content

      # Published Date
      element :published

      def published
        @published ||= @updated
      end

      def published=(val)
        @published = parse_datetime val
      end

      # Updated Date
      element :updated

      def updated=(val)
        @updated = parse_datetime val
      end
    end
  end
end