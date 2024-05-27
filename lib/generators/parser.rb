# frozen_string_literal: true

require_relative 'field'

module Parser
  extend ActiveSupport::Concern

  def initialize(args, *options)
    super

    parse_fields!
  end

  included do
    class_option :component,        type: :string, desc: "Component type"
    class_option :target_root_path, type: :string, desc: "Target Root Path", default: "app"

    argument :verb,   type: :string, default: 'create', desc: 'CRUD verb'
    argument :fields, type: :array,  default: [],       desc: 'field:type'

    attr_reader :parsed_fields, :root_file_path
  end

  def generate_files
    @root_file_path = options[:target_root_path] # default: "app"

    if options[:component]
      case options[:target_root_path]
      when "app"
        @root_file_path = "app/components/#{options[:component]}"
      when "test"
        @root_file_path = "test/components/#{options[:component]}"
      else
        raise("Invalid target_root_path: #{options[:target_root_path]}")
      end
    end
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
