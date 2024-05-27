# frozen_string_literal: true

# All the places where the scaffold generator can be placed:

# generators/business_logic/business_logic/business_logic_generator
# generators/business_logic/business_logic_generator
# generators/business_logic_generator

# Chosen place: generators/business_logic/business_logic_generator

# rails generate business_logic User create name:string email:string --test_framework=test_unit --force

# rails g --help

# BusinessLogic:
#   business_logic:business_logic
#   business_logic:action
#   business_logic:action:test_unit
#   business_logic:schema
#   business_logic:schema:test_unit

# NOTE: If you place the generator under lib/generators/business_logic_generator.rb. it will appear as:

# rails g --help

# BusinessLogic:
#   business_logic
#   business_logic:action
#   business_logic:action:test_unit
#   business_logic:schema
#   business_logic:schema:test_unit

# NOTE: You might want to name the generator as scaffold_generator.rb

# rails g --help

# BusinessLogic:
#   business_logic:scaffold
#   business_logic:action
#   business_logic:action:test_unit
#   business_logic:schema
#   business_logic:schema:test_unit

# rails generate business_logic:scaffold User create name:string email:string --test_framework=test_unit --force

# For that change the name of the class and the file to scaffold_generator.rb

require_relative "../parser"

module BusinessLogic
  module Generators
    class BusinessLogicGenerator < Rails::Generators::NamedBase

      include Parser

      desc <<~DESC
        Description:
            Generates Business Logic Files
            example: rails generate business_logic user create name:string
      DESC

      def invoke_generators
        invoke "business_logic:schema", [name, verb, fields], options

        operation_actions = %w[create update destroy]

        if verb == "all"
          operation_actions.each do |action|
            # Thor like Rake (and Make) has task management, and prevent to invoke a task more than once.
            reinvoke "business_logic:action", [name, action], options
          end
        else
          verb.split(",").select { |v| operation_actions.include?(v) }.each do |action|
            reinvoke "business_logic:action", [name, action], options
          end
        end
      end

      no_commands do
        def reinvoke(task, args, options)
          script = self.class.new(args, options)
          script.invoke(task)
        end
      end

    end
  end
end
