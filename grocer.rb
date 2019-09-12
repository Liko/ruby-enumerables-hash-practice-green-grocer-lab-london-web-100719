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

    if (cart[coupon[:item]] == coupon[:item] && cart[coupon[:item]][:count] >= coupon[:num])
      
      adjusted_item = coupon[:item] + " W/COUPON"
      adjusted_num = (cart[coupon[:item]][:count] / coupon[:num]) * coupon[:num]
      adjusted_cost = coupon[:cost] / coupon[:num]
    
      
      cart[coupon[:item]][:count] = (cart[coupon[:item]][:count] % coupon[:num])
      
      if cart[adjusted_item]
        cart[adjusted_item][:count] += coupon[:num]
      else 
        cart[adjusted_item] = {
          price: adjusted_cost,
          clearance: true,
          count: adjusted_num
        }
      end
    end
  end 
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

# coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]

# cart = {
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
#   "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
# }

# apply_coupons(cart, coupons)