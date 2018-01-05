# frozen_string_literal: true

require_relative 'recipe_representer'

# Represents essential Page information for API output
module RecipeBuddy
  # Represents essential Page information for API output
  class PageRepresenter < Roar::Decorator
    include Roar::JSON

    property :id
    property :origin_id
    property :name
    property :request_id
    collection :recipes, extend: RecipeRepresenter, class: OpenStruct
  end
end
