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
  # code here
  #check for items which also have a coupon 
  #with these items, check if the count in basket is at least equal to num in coupon, if so, apply the coupon, if not, check the next items
  
  coupons.each do |coupon|
    coupon_item = coupon.values[0]
    coupon_num = coupon.values[1]
    coupon_cost = coupon.values[2]
    
    if (cart[coupon_item][:count] >= coupon_num)
      #apply coupon
      
      adjusted_item = coupon_item + " W/COUPON"
      adjusted_num = (cart[coupon_item][:count] / coupon_num) * coupon_num
      adjusted_cost = coupon_cost / coupon_num
      
      puts adjusted_item
      puts adjusted_num
      puts adjusted_cost
    end

    
    

  end 

  
  puts cart
  

  
  
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