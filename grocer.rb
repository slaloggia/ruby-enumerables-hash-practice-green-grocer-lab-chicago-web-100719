def consolidate_cart(cart)
  cart_hash = {}
  cart.each{
    |array| array.each do
    |item, values| cart_hash[item] ||= values
    cart_hash[item][:count] ? cart_hash[item][:count] +=1 :
    cart_hash[item][:count] = 1 
  end
  }
return cart_hash

end

def apply_coupons(cart, coupons)
  coupons.each{
    |coupon| coupon.each do
    |attribute, value| 
    name = coupon[:item]
    
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1 
      else 
        cart["#{name} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[:clearance], :count => 1 
      end
      cart[name][:count] -= coupon[:num]
    else 
    end
  end
  }
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
