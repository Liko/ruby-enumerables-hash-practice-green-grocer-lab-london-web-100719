def consolidate_cart(cart)
  cart_hash = {}
  
  cart.each do |item|
    if cart_hash[item.keys.first]
      cart_hash[item.keys.first][:count] += 1 
    else 
      cart_hash[item.keys.first] = {
        price: item.values.first[:price],
        clearance: item.values.first[:clearance],
        count: 1
      }
    end   
  end   
  
  cart_hash
end

def apply_coupons(cart, coupons)
  # code here
  #check for items which also have a coupon 
  #with these items, check if the count in basket is at least equal to num in coupon, if so, apply the coupon, if not, check the next items
  
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]

cart = {
  "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
}

apply_coupons(cart, coupons)