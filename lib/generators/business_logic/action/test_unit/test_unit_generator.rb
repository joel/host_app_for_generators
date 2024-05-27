# frozen_string_literal: true

require_relative "../../../parser"

module BusinessLogic
  module Generators
    module Action
      class TestUnitGenerator < Rails::Generators::NamedBase

        include Parser

        source_root File.expand_path("templates", __dir__)

        def generate_files
          super

          if options[:component]
            # rails generate business_logic User create name:string email:string --test_framework=test_unit --component=identity --force
            # i.e. template "action_test.rb.erb.tt", "test/components/identity/actions/#{file_name}_action_test.rb"
            template "action_test.rb.erb.tt", "#{root_file_path}/actions/#{file_name}_action_test.rb"
          else
            template "action_test.rb.erb.tt", "test/actions/#{file_name}_action_test.rb"
          end
        end
      end
    end
  end
end