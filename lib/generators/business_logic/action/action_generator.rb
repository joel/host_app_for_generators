# frozen_string_literal: true

module BusinessLogic
  module Generators
    class ActionGenerator < Rails::Generators::NamedBase

      source_root File.expand_path("templates", __dir__)

      hook_for :test_framework, in: "business_logic/action"

      def generate_files
        template "action.rb.erb.tt", "app/actions/#{file_name}_action.rb"
      end

    end
  end
end
