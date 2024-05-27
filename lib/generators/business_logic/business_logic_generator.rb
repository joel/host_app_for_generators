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
        invoke "business_logic:action", [name, verb], options
        invoke "business_logic:schema", [name, verb, fields], options
      end

    end
  end
end
