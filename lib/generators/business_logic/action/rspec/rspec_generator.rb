# frozen_string_literal: true

module BusinessLogic
  module Generators
    module Action
      class RspecGenerator < Rails::Generators::NamedBase

        source_root File.expand_path("templates", __dir__)

        def generate_files
          template "action_spec.rb.erb.tt", "spec/actions/#{file_name}_spec.rb"
        end
      end
    end
  end
end