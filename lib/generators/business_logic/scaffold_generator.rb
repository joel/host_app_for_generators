# frozen_string_literal: true

module BusinessLogic
  module Generators

    class Field

      attr_accessor :name, :type

      class << self

        def parse(field)
          name, type = field.split(/:/)

          new(name, type)
        end

      end

      def initialize(name, type)
        @name = name
        @type = type || "string"
      end

    end

    class BusinessLogicGenerator < Rails::Generators::NamedBase

      argument :verb,   type: :string, default: "create", desc: "CRUD verb"
      argument :fields, type: :array,  default: [],       desc: "field:type"

      desc <<~DESC
        Description:
            Generates Business Logic Files
            example: rails generate business_logic user create name:string
      DESC

      def initialize(args, *options)
        super

        parse_fields!
      end

      def invoke_generators
        invoke "business_logic:action", [name, verb], options
        invoke "business_logic:schema", [name, verb, fields], options
      end

      no_commands do
        def parse_fields!
          @parsed_fields ||= [].tap do |parsed_fields|
            fields.each do |field_raw_value|
              parsed_fields << Field.parse(field_raw_value)
            end
          end
        end
      end

    end
  end
end
