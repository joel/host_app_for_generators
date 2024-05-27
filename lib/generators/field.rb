# frozen_string_literal: true

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
    @type = type || 'string'
  end
end
