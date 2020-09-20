require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      foreign_key: "#{name}_id".to_sym,
      primary_key: :id,
      class_name: "#{name}".capitalize
    }

    defaults.each do |key, value|
      send("#{key}=", options[key] || value )
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      foreign_key: "#{self_class_name.downcase || name}_id".to_sym,
      primary_key: :id,
      class_name: name.capitalize.to_s.singularize
    }
    defaults.each do |key, value|
      send("#{key}=", options[key] || value )
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      foreign_key = send(options.foreign_key)
      model_class = options.class_name
      options.model_class.where({options.primary_key => foreign_key}).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)
    define_method(name) do
      primary_key = send(options.primary_key)
      model_class = options.class_name
      options.model_class.where({options.foreign_key => primary_key})
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
  extend Searchable
end
