class Object
  alias :freeze! :freeze
end

class Array
  def freeze!
    super()
    self.each do |object|
      object.freeze!
    end
  end
end

class Hash
  def freeze!
    super()
    self.each do |key, value|
      key.freeze!
      value.freeze!
    end
  end
end
