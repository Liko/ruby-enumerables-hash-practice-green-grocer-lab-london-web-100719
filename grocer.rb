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
  
  coupons.each do |coupon|

    if (cart.keys.include?(coupon[:item]) && cart[coupon[:item]][:count] >= coupon[:num])
      clearance_item_name = coupon[:item] + " W/COUPON"
      cart[coupon[:item]][:count] -= coupon[:num] #update existing
      
      if cart[clearance_item_name]
        cart[clearance_item_name][:count] += coupon[:num]
      else 
        cart[clearance_item_name] = {
          price: coupon[:cost] / coupon[:num],
          clearance: cart[coupon[:item]][:clearance],
          count: coupon[:num]
        }
      end
    end
  end 
  cart
end

def apply_clearance(cart)
  cart.keys.each do |item|
    if (cart[item][:clearance])
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
    end 
  end 
  cart 
end

def checkout(cart, coupons)
  discounted_cart = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
  # cart1 = consolidate_cart(cart)
  # cart2 = apply_coupons(cart1, coupons)
  # discounted_cart = apply_clearance(cart2)
  total = 0.0 
  
  discounted_cart.keys.each do |item|
    puts discounted_cart[item]
    total += discounted_cart[item][:price] * discounted_cart[item][:count]
  end 
  
  if total > 100
    total *= 0.9
  end 
end

coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]

cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]

# apply_coupons(cart, coupons)
# apply_clearance(cart)
checkout(cart, coupons)