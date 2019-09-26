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
        cart["#{name} W/COUPON"][:count] += coupon[:num] 
      else 
        cart["#{name} W/COUPON"] = {:price => (coupon[:cost] / coupon[:num]), :clearance => cart[name][:clearance], :count => coupon[:num]} 
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  }
  return cart
end


def apply_clearance(cart)
  cart.map{
    |item| item.each do
      |name, attributes|
      if name[:clearance] == true 
        name[:price] = (name[:price] * 0.8).round
      end
    end
  }
end

def checkout(cart, coupons)
  # code here
end
