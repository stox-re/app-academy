require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
   return @column_names unless @column_names.nil?

    @column_names =
      DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      LIMIT 1
      SQL
      .first

    @column_names.map! { |column_name| column_name.to_sym }
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        attributes[name]
      end
      define_method("#{name}=") do |value|
        attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name.nil? ? ActiveSupport::Inflector.tableize(name) : @table_name
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT * FROM #{self.table_name} WHERE id = ? LIMIT 1
    SQL
    parse_all(result).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise Exception.new("unknown attribute '#{attr_name}'") if !self.class.columns.include?(attr_name.to_sym)
      self.send("#{attr_name.to_sym}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |attribute|
      self.send(attribute)
    end
  end

  def insert
    col_names = self.class.columns.drop(1)
    question_marks = (["?"] * col_names.length).join(",")
    col_names = col_names.join(",")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO #{self.class.table_name} (#{col_names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.drop(1)
    question_marks = (["?"] * col_names.length).join(",")

    set_values = []
    col_names.each_with_index do |col, idx|
      if idx == col_names.length - 1
        set_values << col.to_s + " = ?"
      else
        set_values << col.to_s + " = ?, "
      end
    end
    set_values = set_values.join("")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      UPDATE #{self.class.table_name}
      SET #{set_values}
      WHERE id = #{self.id}
    SQL

  end

  def save
    if self.id == nil
      insert
    else
      update
    end
  end
end
