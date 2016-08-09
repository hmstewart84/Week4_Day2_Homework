require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative('../models/shoos' )

class TestShoe < Minitest::Test

  def setup()
    @shoe = Shoe.new({
      "first_name" => "Sylvia",
      "last_name" => "Plonkton",
      "address" => "27 Highgrove Place",
      "quantity" => 2,
      "size" => 8
      })
  end

  def test_first_name()
    assert_equal( 'Sylvia', @shoe.first_name() )
  end  

  def test_last_name()
    assert_equal( 'Plonkton', @shoe.last_name() )
  end  

  def test_pretty_name()
    assert_equal('Sylvia Plonkton', @shoe.pretty_name() )
  end  

  def test_has_address()
    assert_equal( '27 Highgrove Place', @shoe.address() )
  end 

  def test_has_quantity()
    assert_equal( 2, @shoe.quantity() )
  end  

  def test_has_size()
    assert_equal( 8, @shoe.size() )
  end  

  def test_total()
    assert_equal( 200, @shoe.total() )
  end

end  