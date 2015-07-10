class Auction
    
    attr_accessor   :bids, :next_auction,:item, :sold, :called

    def initialize(item,next_auction_inline=nil)
      @item = item
      @bids = []
      @called = false
      @sold = false
      @next_auction = next_auction_inline
    end             
    
    def status
        #If the current highest bid is higher than the reserved price of the item, 
        #the auction is deemed as a success otherwise it's marked as failure.
        #make this a conditional if sold or not
        winning_bid = @bids[@bids.length-1]
        if self.called == true 
            if @bids.length >0 && winning_bid.amount > @item.price 
                "success"
            else
                "failure"
            end 
        end
    end
end



