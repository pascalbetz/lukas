class Finder
  FIND_BY_DEPARTMENT = <<-SQL

  SQL

  FIND_BY_NAME = <<-SQL

  SQL

  def self.find_all_by_department(department)
    result = []
    db = SQLite3::Database.open("data.sqlite")
    db.execute(FIND_BY_DEPARTMENT, department).each do |row|
      result << {
        name: row[0],
        age: row[1],
        department_name: row[2]
      }
    end
    db.close
    result
  end

  def self.find_by_name(name)
    result = nil
    db = SQLite3::Database.open("data.sqlite")
    db.execute(FIND_BY_NAME, name).each do |row|
      result = {
        name: row[0],
        age: row[1],
        department_name: row[2]
      }
    end
    db.close
    result
  end
end
