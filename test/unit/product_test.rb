require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def new_product(image_url)
    Product.new(
      :title => "My Book title",
      :description => "ddddddddddd",
      :price => 1,
      :image_url => image_url
     )
  end

  # test "Product attributes must not be empty" do
  #   product = Product.new
  #   assert product.invalid?
  #   assert product.errors[:title].any?
  #   assert product.errors[:description].any?
  #   assert product.errors[:price].any?
  #   assert product.errors[:image_url].any?
  # end

  test "测试Product的image_url" do
    ok  = %w{ dafd.png ADF.JPG DFAJL.JpG http://a.nb.c/x/hy/z/123.gif a.sss }
    bad = %w{ fdsf.doc a.rar a.zip a.tar a.jpg.aa a.gif}
    
    ok.each do |url|
      assert new_product(url).valid?, "#{url} 无法通过验证---------------------"
    end

    bad.each do |url|
      assert new_product(url).invalid?, "#{url} 可以通过验证…………………………………………………"
    end

  end

end
