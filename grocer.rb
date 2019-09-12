def consolidate_cart(cart_array)
  cart_hash = {}
  
  cart_array.length.times do |i|
    #add each item to the cart_hash, and add a count key:value to the hash. if it is the first time, add it with quantity is 1. for each time, check if it is the first time or not, and if it is not the first time, simply update the count.
    cart_item = cart_array[i]
    cart_item_key = cart_item.keys
    
    puts cart_item_key
    
    if cart_hash[cart_item_key]
      cart_hash[cart_item_key][:count] += 1 
    else 
      
    end   
    
    
  end   
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

consolidate_cart([
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
])