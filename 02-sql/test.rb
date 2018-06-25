require "minitest/autorun"
require "sqlite3"
require_relative "finder"
require_relative "seed"
require "byebug"

class Test < MiniTest::Unit::TestCase

  def test_find_by_name_with_unknown_name
    person = Finder.find_by_name("unknown")

    assert_nil person
  end

  def test_find_by_name
    person = Finder.find_by_name("Pascal")
    expectation = {
      name: "Pascal",
      age: 41,
      department_name: "it"
    }

    assert_equal expectation, person
  end

  def test_find_all_by_department_name_with_unknown_name
    people = Finder.find_all_by_department("unknown")

    assert_equal [], people
  end

  def test_find_all_by_department_name
    person = Finder.find_all_by_department("it")
    expectation = [
      {
        name: "Lukas",
        age: 15,
        department_name: "it"
      },
      {
        name: "Pascal",
        age: 41,
        department_name: "it"
      }
    ]

    assert_equal expectation, person
  end


end
