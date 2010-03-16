module Helpers
  def first_helper

  end
  def self.second_helper
  end
end

module ClassMethods
  def class_method

  end
end

module HelpersViaInclude
  def self.included(klass)
    klass.send(:extend ,ClassMethods)
  end
  module ClassMethods
    def included_class_method

    end
  end
end

module ShowMethods
  module Fixtures
    class ClassWithSomeMethods
      include ::Helpers
      extend ::ClassMethods  
      include ::HelpersViaInclude
      def one

      end
      def two

      end
      def self.three

      end
      def self.four

      end
    end
  end
end

