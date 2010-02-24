#module ShowMethods
class Object
  def show_methods
    result = {}
    is_eigenklass = self.instance_of?(Class)
    (is_eigenklass ? self : self.class).ancestors.each do |a|
       result[a.name]=[]
       if is_eigenklass 
         a.singleton_methods(false).each do |m|
           result[a.name].push m
         end
       else
         a.instance_methods(false).each do |m|
           result[a.name].push m
         end
       end
    end
    result
  end
end
#end
