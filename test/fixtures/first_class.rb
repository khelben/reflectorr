module ShowMethods
  module Fixtures
    class FirstClass
      def simple_method
        {}
      end
    end
    class SecondClass < FirstClass
      def second_simple_method
        ""
      end
    end
    class ThirdClass
      def self.third_method
        ""
      end
    end
    class FourthClass < ThirdClass
      def self.fourth_method

      end
    end
  end
end
