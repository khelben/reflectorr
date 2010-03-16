#module ShowMethods
class Object
  def show_methods
    result = {}
    self.class.ancestors.each do |a|
      result[a.name]=[]
      a.instance_methods(false).sort.each do |m|
        result[a.name].push m
      end
    end
    result
  end
  def self.show_methods
    result = {}
    metaclass = class << self; self; end
    self.ancestors.each do |a|
      result[a.name] ||= []
      a.singleton_methods(false).sort.each do |m|
        result[a.name].push m
      end
    end
    metaclass.ancestors.each do |a|
      result[a.name] ||= []
      a.instance_methods(false).sort.each do |m|
        result[a.name].push m
      end
    end
    result
  end
end
#end
