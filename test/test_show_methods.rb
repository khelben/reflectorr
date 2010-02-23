require 'helper'

class TestShowMethods < Test::Unit::TestCase
  context "instance methods" do
    context "simple_methods" do
      should "show the method" do
        result = ShowMethods::Fixtures::FirstClass.new.send(:show_methods)
        assert result.is_a?(Hash), "Result should be an Hash"
        "ShowMethods::Fixtures::FirstClass".tap do |m|
          assert result.has_key?(m), "the module ShowMethods should be a key in the result hash"
          assert_contains result[m], "simple_method", "the method 'simple_method' should be in the result"
        end
      end
    end

    context "subclass" do
      should "show methods of superclass" do
        result = ShowMethods::Fixtures::SecondClass.new.send(:show_methods)
        assert result.is_a?(Hash), "Result should be an Hash"
        "ShowMethods::Fixtures::SecondClass".tap do |m|
          assert result.has_key?(m)
          assert_contains result[m], "second_simple_method"
        end
        "ShowMethods::Fixtures::FirstClass".tap do |m|
          assert result.has_key?(m), "the module ShowMethods should be a key in the result hash"
          assert_contains result[m], "simple_method", "the method 'simple_method' should be in the result"
        end
      end
    end
  end
  context "class methods" do
    context "third_method" do
      should "show the method" do
        result = ShowMethods::Fixtures::ThirdClass.send(:show_methods)
        "ShowMethods::Fixtures::ThirdClass".tap do |m|
          assert result.has_key?(m)
          assert_contains result[m], "third_method"
        end
      end
    end
    context "subclass" do
      should "show class methods from FourthClass and ThirdClass" do
         result = ShowMethods::Fixtures::FourthClass.send(:show_methods)
         "ShowMethods::Fixtures::FourthClass".tap do |m|
           assert result.has_key?(m)
           assert_contains result[m], "fourth_method"
         end
         "ShowMethods::Fixtures::ThirdClass".tap do |m|
           assert result.has_key?(m)
           assert_contains result[m], "third_method"
         end
      end
    end
  end
end
