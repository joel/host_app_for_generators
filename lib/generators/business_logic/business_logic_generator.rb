# frozen_string_literal: true

# generators/business_logic/business_logic/business_logic_generator
# generators/business_logic/business_logic_generator
# generators/rails/business_logic/business_logic_generator
# generators/rails/business_logic_generator
# generators/business_logic_generator

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
