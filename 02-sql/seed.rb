require "sqlite3"
puts "Seeding DB"

DEPARTMENTS = [{name: "sales"}, {name: "marketing"}, {name: "hr"}, {name: "it"}]
PEOPLE = [
  {name: "Lukas", department: "it", age: 15},
  {name: "Pascal", department: "it", age: 41},
  {name: "Stefan", department: "hr", age: 32},
  {name: "Chris", department: "sales", age: 44},
  {name: "Mark", department: "marketing", age: 55},
]

db = SQLite3::Database.open("data.sqlite")

db.execute("DROP TABLE IF EXISTS departments")
db.execute("DROP TABLE IF EXISTS people")

db.execute <<-SQL
  CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL UNIQUE
  )
SQL

db.execute <<-SQL
  CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    department_id NUMERIC NOT NULL REFERENCES departments(id),
    age INTEGER NOT NULL
  )
SQL

DEPARTMENTS.each do |department|
  db.execute("INSERT INTO departments (name) VALUES (?)", department[:name])
end
department_with_ids = db.execute("SELECT * FROM departments")

PEOPLE.each do |person|
  department_id = department_with_ids.find { |_id, name| name == person[:department] }.first

  db.execute(
    "INSERT INTO people (name, department_id, age) VALUES (?, ?, ?);",
    [
      person[:name],
      department_id,
      person[:age]
    ]
  )
end
db.close
