require_relative( '../db/sql_runner' )

class Shoe

  attr_reader( :first_name, :last_name, :address, :brand, :quantity, :size, :id )

  def initialize(options)
    @first_name = options[ "first_name" ]
    @last_name = options[ "last_name" ]
    @address = options[ "address" ]
    @brand = options[ "brand" ]
    @quantity = options[ 'quantity' ].to_i
    @size = options[ 'size' ].to_i
    @id = options[ 'id' ].to_i
  end  

  def pretty_name
    return @first_name.concat( " #{@last_name}" )
  end  

  def total
    return @quantity * 100
  end 

  def save
    sql = "INSERT INTO shoes ( 
        first_name,
        last_name,
        address,
        brand,
        quantity,
        size ) VALUES ( 
        '#{@first_name}',
        '#{@last_name}',
        '#{@address}',
        '#{@brand}',
        #{@quantity},
        #{@size}
         ) RETURNING *;"
           shoe = SqlRunner.run( sql ).first
           @id = shoe[ 'id' ].to_i    
  end  

  def self.all()
    sql = "SELECT * FROM shoes;"
    shoes = SqlRunner.run( sql ) #no .first this time cos we want all of them
    result = shoes.map { |shoe| Shoe.new(shoe) } #breaking them into individual elements and making new object
    return result
  end  



end  