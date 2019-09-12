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
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end