# frozen_string_literal: true

# Represents essential Video information for API output
# USAGE:
#   video = # Get from gateway
#   VideoRepresenter.new(OpenStruct.new).from_json video

# Add Representer to module
module RecipeBuddy
  # Represents essential Video information for API output
  class VideoRepresenter < Roar::Decorator
    include Roar::JSON

    property :origin_id
    property :title
    property :published_at
    property :description
    property :channel_id
    property :channel_title
  end
end
