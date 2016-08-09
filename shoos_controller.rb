require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/shoos' )

get '/shoos/new' do
  erb( :new )
end  

post '/shoos' do
  @shoe = Shoe.new( params )
  @shoe.save()  
  #save the order, create shoe
  erb( :create )  #for customer to see what they've ordered.
end  

get '/shoos' do
  @shoes = Shoe.all()
  erb( :index ) #for shoe shop to see everything that has been order.
end  
