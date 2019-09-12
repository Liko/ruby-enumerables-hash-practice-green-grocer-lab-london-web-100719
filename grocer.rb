def consolidate_cart(cart_array)
  cart_hash = {}
  
  cart_array.each do |item|
    #add each item to the cart_hash, and add a count key:value to the hash. if it is the first time, add it with quantity is 1. for each time, check if it is the first time or not, and if it is not the first time, simply update the count.
  

    
    if cart_hash[item.keys.first]
      cart_hash[item.keys.first][:count] += 1 
    else 
      cart_hash[cart_item_key] = {
        price: cart_item_value[:price],
        clearance: cart_item_value[:clearance],
        count: 1
      }
     
      
    end   
    
    puts cart_hash
    
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