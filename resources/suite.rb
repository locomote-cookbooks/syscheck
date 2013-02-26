actions :nothing, :run

attribute :name, :kind_of => String, :name_attribute => true
attribute :source, :kind_of => String, :required => true

def initialize(*args)
  super
  @action = :run
  @source = @name
end
