# frozen_string_literal: true

require_relative "../../parser"

module BusinessLogic
  module Generators
    class ActionGenerator < Rails::Generators::NamedBase

      include Parser

      source_root File.expand_path("templates", __dir__)

      hook_for :test_framework, in: "business_logic:action" do |test|
        new_options = options.dup
        new_options[:target_root_path] = "test"
        invoke test, [name, verb, fields], new_options
      end

      def generate_files
        super

        if options[:component]
          # rails generate business_logic User create name:string email:string --test_framework=test_unit --component=identity --force
          # i.e. template "action.rb.erb.tt", "app/components/identity/actions/#{file_name}_action.rb"
          template "action.rb.erb.tt", "#{root_file_path}/actions/#{file_name}_action.rb"
        else
          template "action.rb.erb.tt", "app/actions/#{file_name}_action.rb"
        end
      end

    end
  end
end
