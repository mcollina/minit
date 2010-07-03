class Sequence
  include Mongoid::Document
  field :name, :type => String
  field :counter, :type => Integer, :default => 0
  
  key :name
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :counter
  
  def next
    unless persisted?
      result = counter
      self.counter += 1
      save if valid?
    else
      result = Mongoid::Config.instance.master.
        collection(collection_name).find_and_modify( 
          :query => { :name => name },
          :update => { :'$inc' => { :counter => 1 } } 
          )["counter"]
      reload
    end
    result
  end
  
  def self.next(name)
    find_or_create_by(:name => name).next
  end
end
