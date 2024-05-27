# frozen_string_literal: true

require_relative "../../parser"

module BusinessLogic
  module Generators
    class SchemaGenerator < Rails::Generators::NamedBase

      include Parser

      source_root File.expand_path("templates", __dir__)

      # hook_for :test_framework, in: "business_logic:schema"

      def generate_files
        template "schema.rb.erb.tt", "app/schemas/#{file_name}_schema.rb"
      end

    end
  end
end
