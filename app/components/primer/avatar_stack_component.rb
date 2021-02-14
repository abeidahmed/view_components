# frozen_string_literal: true

module Primer
  class AvatarStackComponent < Primer::Component
    include ViewComponent::SlotableV2

    renders_many :avatars, "Avatar"
    renders_one :body, "Body"

    def initialize(**system_arguments)
      @system_arguments = system_arguments
      @system_arguments[:tag] = :div

      @system_arguments[:classes] = class_names(
        "AvatarStack",
        system_arguments[:classes],
      )
    end

    def render?
      avatars.any? || body.present?
    end

    def self.status
      Primer::Component::STATUSES[:beta]
    end

    class Avatar < Primer::Slot
      attr_reader :system_arguments

      def initialize(**system_arguments)
        @system_arguments = system_arguments
      end
    end

    class Body < Primer::Slot
      attr_reader :system_arguments

      def initialize(**system_arguments)
        @system_arguments = system_arguments
        @system_arguments[:tag] = :div

        @system_arguments[:classes] = class_names(
          "AvatarStack-body",
          system_arguments[:classes],
        )
      end
    end
  end
end
