class Store
    # mock check for seeing if store exists
    # if store does not exist create a new store
    attr_accessor :store
    def initialize
        @store = Hash.new
    end
    
    def add_item(item_name,price)
        # @store = self.store[item_name] = price
        @store[item_name] = price
        @store
    end
    
    def has_item?(item_name)
        @store[item_name] #!= nil
    end
end