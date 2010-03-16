require 'helper'
require 'json'

class TestShowMethods < Test::Unit::TestCase
  context "Class With some instance methods" do
    setup do
      @result = ShowMethods::Fixtures::ClassWithSomeMethods.new.show_methods
    end
    should "show the instance methods from its own class" do
      assert @result.has_key?("ShowMethods::Fixtures::ClassWithSomeMethods")
      assert_same_elements @result["ShowMethods::Fixtures::ClassWithSomeMethods"], ["one", "two"]
    end
    should "show the methods from the included Helpers module" do
      assert @result.has_key?("Helpers")
      assert_same_elements @result["Helpers"], ["first_helper"]
    end
  end
  context "class with some class methods" do
    setup do
      @result = ShowMethods::Fixtures::ClassWithSomeMethods.show_methods
    end
    should "show the class methods" do
      assert @result.has_key?("ShowMethods::Fixtures::ClassWithSomeMethods")
      assert_same_elements @result["ShowMethods::Fixtures::ClassWithSomeMethods"], ["three", "four"]
    end
    should "show the class methods defined in another module" do
      assert @result.has_key?("Helpers")
      assert_same_elements @result["Helpers"], ["second_helper"]
    end
    should "show the class methods from the module via extend" do
      assert @result.has_key?("ClassMethods")
      assert_same_elements @result["ClassMethods"], ["class_method"]
    end
    should "show the class methods from the HelpersViaInclude module" do
      assert @result.has_key?("HelpersViaInclude::ClassMethods")
      assert_same_elements @result["HelpersViaInclude::ClassMethods"], ["included_class_method"]
    end
  end
end
