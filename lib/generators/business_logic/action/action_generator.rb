# frozen_string_literal: true

module BusinessLogic
  module Generators
    class ActionGenerator < Rails::Generators::NamedBase

      source_root File.expand_path("templates", __dir__)

      # hook_for :test_framework, in: "in/hook/for/in", as: "as/hook/for/as"
      hook_for :test_framework#, in: "hook_for_in", as: "hook_for_as"

      # ERROR:: path: rails/generators/in/hook/for/in/test_unit/test_unit_generator
      # ERROR:: path: rails/generators/in/hook/for/in/test_unit_generator
      # ERROR:: path: rails/generators/test_unit/as/hook/for/as/as/hook/for/as_generator
      # ERROR:: path: rails/generators/test_unit/as/hook/for/as_generator

      # ERROR:: path: generators/in/hook/for/in/test_unit/test_unit_generator
      # ERROR:: path: generators/in/hook/for/in/test_unit_generator
      # ERROR:: path: generators/test_unit/as/hook/for/as/as/hook/for/as_generator
      # ERROR:: path: generators/test_unit/as/hook/for/as_generator

      # ERROR:: path: rails/generators/hook_for_in/test_unit/test_unit_generator
      # ERROR:: path: rails/generators/hook_for_in/test_unit_generator
      # ERROR:: path: rails/generators/test_unit/hook_for_as/hook_for_as_generator
      # ERROR:: path: rails/generators/test_unit/hook_for_as_generator

      # ERROR:: path: generators/hook_for_in/test_unit/test_unit_generator
      # ERROR:: path: generators/hook_for_in/test_unit_generator
      # ERROR:: path: generators/test_unit/hook_for_as/hook_for_as_generator
      # ERROR:: path: generators/test_unit/hook_for_as_generator

      # ERROR:: path: rails/generators/business_logic/test_unit/test_unit_generator
      # ERROR:: path: rails/generators/business_logic/test_unit_generator
      # ERROR:: path: rails/generators/test_unit/action/action_generator
      # ERROR:: path: rails/generators/test_unit/action_generator

      # ERROR:: path: generators/business_logic/test_unit/test_unit_generator
      # ERROR:: path: generators/business_logic/test_unit_generator
      # ERROR:: path: generators/test_unit/action/action_generator
      # ERROR:: path: generators/test_unit/action_generator

      def generate_files
        template "action.rb.erb.tt", "app/actions/#{file_name}_action.rb"
      end

    end
  end
end
