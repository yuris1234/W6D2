class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.map! {|name| name.is_a?(Symbol) ? name.to_s : name }
    names.each do |name|
      define_method(name) do 
        self.instance_variable_get("@#{name}")
      end
    end
    names.each do |name|
      define_method("#{name}=") do |new_val|
        self.instance_variable_set("@#{name}", new_val)
      end
    end
  end
end
