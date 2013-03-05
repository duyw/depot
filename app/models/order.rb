class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy #无论何时，只要订单被销毁，订单中所有的商品条目都要被销毁

  PAYMENT_TYPES = ["Check","Credit card","Purchase order"]
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil  # 断开 cart 和 line_item 之间的关联
      line_items << item
    end
  end
end
