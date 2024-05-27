# frozen_string_literal: true

module BusinessLogic
  module Generators
    module Action
      class TestUnitGenerator < Rails::Generators::NamedBase

        source_root File.expand_path("templates", __dir__)

        def generate_files
          template "action_test.rb.erb.tt", "test/actions/#{file_name}_test.rb"
        end
      end
    end
  end
end