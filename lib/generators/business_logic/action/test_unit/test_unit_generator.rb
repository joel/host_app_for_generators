# frozen_string_literal: true

require_relative "../../../parser"

module BusinessLogic
  module Generators
    module Action
      class TestUnitGenerator < Rails::Generators::NamedBase

        include Parser

        source_root File.expand_path("templates", __dir__)

        def generate_files
          template "action_test.rb.erb.tt", "test/actions/#{file_name}_test.rb"
        end
      end
    end
  end
end