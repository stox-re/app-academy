require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true # Makes sure data coming back is the same data type as what the schema of the database was
    self.results_as_hash = true # Returns results as a hash
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @year = options["year"]
    @playwright_id = options["playwright_id"]
  end

  def create
    raise "#{self} is already in the Database" if @id != nil
    # heredoc <<-SQL    __everything is read as a string__   SQL
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO plays (title, year, playwright_id)
      VALUES (?, ?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
    # SQL Injection Attacks
    # playwright_id = "3; DROP TABLE plays;"
    # Using the (?, ?, ?) protects against that, it sanitizes the input.
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE plays
      SET
        title = ?,
        year = ?,
        playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

puts Play.all
puts salesman = Play.new("title" => "Death of a Salesman", "year" => 1948, "playwright_id" => 1)
puts salesman.create
puts Play.all
puts salesman.year = 1949
puts salesman.update
puts Play.all