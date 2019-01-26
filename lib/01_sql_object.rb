require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    cols = DBConnection.execute(<<-SQL).first
      SELECT *
      FROM #{self.table_name}
    SQL
    @columns = cols
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.downcase.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|instance| self.new(instance)}
  end

  def self.find(id)
    result = DBConnection.execut(<<-SQL)
    SELECT *
    FROM #{table_name}
    WHERE #{table_name}.id = #{id}
    SQL
    parse_all(result)
  end

  def initialize(params = {})
    params.each do |k, v|
      k.to_sym!
      

    end
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
