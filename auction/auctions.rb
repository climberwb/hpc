class Auctions
  attr_reader  :auction
   
  def initialize item
        @auction = Auction.new(item)
        @store = Store.new
  end
  
  def add_item_to_store(item_name,price)
      raise "store has this item" if @store.store[item_name] != nil
      @store.store = @store.add_item(item_name,price)
      @store
  end
   
   def add_auction(item)
        # Traverse to the end of the list
        # And insert a new auction with the specified item
        @store = add_item_to_store(item.name,item.price)
        current_auction = @auction
        
        while current_auction.next_auction != nil 
             current_auction =  current_auction.next_auction 
        end
        current_auction.next_auction = Auction.new(item,nil)
      
   end
   
   def latest_action(item_name)
       item_action =self.query_auction(item_name)
       #{item_action.sold} #{item_action.status}
       item_action.sold ? news = "The item was sold and is a #{item_action.status}" : news = "the item was not sold"  
       "Bidder: #{item_action.bids[item_action.bids.length-1].bidder} Amount: #{item_action.bids[item_action.bids.length-1].amount} #{news}"
   end
   
   
   def query_auction(search_item)
        current_auction = @auction
        exception_string = 'the item: #{search_item} was called by auctioneer and is no longer available'
        if current_auction.item == search_item
             current_auction
        else
        while  current_auction.next_auction != nil && current_auction.next_auction.item != search_item
            current_auction = current_auction.next_auction 
        end
        current_auction.next_auction
        end
    end
end

