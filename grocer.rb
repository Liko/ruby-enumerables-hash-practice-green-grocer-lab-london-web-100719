def consolidate_cart(cart)
  cart_hash = {}
  
  cart.each do |item|
    item_name = item.keys.first 
    
    if cart_hash[item_name]
      cart_hash[item_name][:count] += 1 
    else 
      cart_hash[item_name] = {
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
      clearance_num = (cart[coupon[:item]][:count] / coupon[:num]) * coupon[:num]
      clearance_cost = coupon[:cost] / coupon[:num]
      
      cart[coupon[:item]][:count] = (cart[coupon[:item]][:count] % coupon[:num]) #update existing
      
      if cart[clearance_item_name]
        cart[clearance_item_name][:count] += coupon[:num]
      else 
        cart[clearance_item_name] = {
          price: clearance_cost,
          clearance: true,
          count: clearance_num
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
  consolidate_cart
  apply_coupons
  apply_clearance
end

# coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]

# cart = {
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
#   "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
# }

# apply_coupons(cart, coupons)