require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_clause = []
    params.each do |key, value|
      where_clause << key.to_s + " = ?"
    end
    where_clause = where_clause.join(" AND ")

    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT *
      FROM #{table_name}
      WHERE #{where_clause}
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
