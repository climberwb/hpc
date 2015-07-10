class Bid
    
    attr_accessor :bidder, :amount

    def initialize(bidder, amount)
        @bidder = bidder
        @amount = amount
    end
    
    def submit_bid(auction)
        # a new bid has to have a price higher than the current highest price otherwise its not allowed
       # puts auction.class
        if auction.bids.length >0
            last_bid = auction.bids[auction.bids.length-1] 
            # last_bid.amount < @amount
            raise "Bid Must be higher than #{last_bid.amount}" if last_bid !=nil && last_bid.amount >= @amount
        end
        auction.bids << self 
    end
end


