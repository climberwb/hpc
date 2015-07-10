 require_relative "./auction.rb"
 require_relative "./auctions.rb"
 require_relative "./store.rb"
 require_relative "./bid.rb"
class Item
 
    attr_accessor :name, :price#, :auctions

    def initialize(name, price)
        @name = name
        @price = price
    end
    
    
    def self.start_auction(auctions,item)
        auctions.add_item_to_store(item.name,item.price)
        auctions.query_auction(item)
    end
    
    
    def call_auction(auction)
        auction.called = true
        auction.sold = true if auction.bids.length >0 
        auction.status
    end
    
    def self.latest_action(item_name,auctions)
        #the item should no longer be available for future auctions
        #find that item and return true or false
        auctions.query_auction(name)
    end
end








