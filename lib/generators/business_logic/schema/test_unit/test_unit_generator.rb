# frozen_string_literal: true

require_relative "../../../parser"

module BusinessLogic
  module Generators
    module Schema
      class TestUnitGenerator < Rails::Generators::NamedBase

        include Parser

        source_root File.expand_path("templates", __dir__)

        def generate_files
          super

          template "schema_test.rb.erb.tt", "test/schemas/#{file_name}_test.rb"
        end
      end
    end
  end
end