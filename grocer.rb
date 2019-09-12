def consolidate_cart(cart_array)
  cart_hash = {}
  
  cart_array.each do |item|
    #add each item to the cart_hash, and add a count key:value to the hash. if it is the first time, add it with quantity is 1. for each time, check if it is the first time or not, and if it is not the first time, simply update the count.
  
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