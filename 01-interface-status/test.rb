require "minitest/autorun"
require_relative "parser"

class Test < MiniTest::Unit::TestCase

  def test_does_not_choke_in_empty_input
    assert_equal({}, parsed_output(""))
  end

  def test_does_not_choke_on_nil_input
    assert_equal({}, parsed_output(nil))
  end

  def test_parses_all_interfaces
    assert_equal 74, parsed_output.size
  end

  def test_parses_ten_gig_ports
    assert parsed_output.key?("Te5/1")
  end

  def test_parses_gig_ports
    assert parsed_output.key?("Gi1/1")
  end

  def test_parses_multilevel
    assert parsed_output.key?("Gi1/10/2")
  end

  def test_converts_blank_strings_to_nil
    assert_nil parsed_output["Gi1/1"]["name"]
  end

  def test_reads_all_fields
    output = parsed_output["Gi1/6"]

    assert_equal "name1", output["name"]
    assert_equal "connected", output["status"]
    assert_equal "trunk", output["vlan"]
    assert_equal "full", output["duplex"]
    assert_equal "1000", output["speed"]
    assert_equal "1000BaseLH", output["type"]
  end

  private

  def read_input
    File.read("input.txt")
  end

  def parsed_output(input = read_input)
    parser = Parser.new(input)
    parser.parse
  end
end
