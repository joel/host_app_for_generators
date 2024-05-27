# frozen_string_literal: true

require_relative 'field'

module Parser
  extend ActiveSupport::Concern

  def initialize(args, *options)
    super

    parse_fields!
  end

  included do
    argument :verb,   type: :string, default: 'create', desc: 'CRUD verb'
    argument :fields, type: :array,  default: [],       desc: 'field:type'

    attr_reader :parsed_fields
  end

  private

  def parse_fields!
    @parsed_fields ||= [].tap do |parsed_fields|
      fields.each do |field_raw_value|
        parsed_fields << Field.parse(field_raw_value)
      end
    end
  end
end
