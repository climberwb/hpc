require_relative "./item.rb"
# Run this to get the console outputs for some scenarios of the auction
# If I could go back I would conver these into unit tests

#initialize the first item and auctions
@item1 = Item.new('name',23)
@auctions = Auctions.new(@item1)

# create an auction where the auction is a failure
auction1= Item.start_auction(@auctions,@item1)
my_bid =  Bid.new("dave",20.00) 
my_bid.submit_bid(auction1)
my_bid =  Bid.new("dave",22.00) 
my_bid.submit_bid(auction1)
auction1.bids
puts @item1.call_auction(auction1)
puts @auctions.latest_action(@item1)
 
puts

# create an auction where an action is a success
@item = Item.new('poop',23)
@auctions.add_auction(@item)
auction = @auctions.query_auction(@item)
my_bid =  Bid.new("dave",25.00) 
my_bid.submit_bid(auction)
auction.bids
puts @item.call_auction(auction)
puts @auctions.latest_action(@item)

 
