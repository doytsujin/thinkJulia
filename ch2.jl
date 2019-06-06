## Exercise 2-1
println(5)
x = 5
println(x + 5)

## Exercise 2-2
x = y = 5 # assigns x and y to 5
x % y; # semicolon at the end of the statement prevents output in REPL (interactive mode)
println(5x) # is 5 * x

## Exercise 2-3
function sphereVolume(radius)
  return 4/3 * (pi * radius^3) 
end

println(sphereVolume(5))

function discountedPrice(price, discount)
  return price * (1 - discount);
end

println(discountedPrice(24.95, 0.4))

function shippingCost(numCopies)
  return numCopies > 0 ? 3 + 0.75numCopies : 0
end

println(shippingCost(60) + discountedPrice(24.95, 0.4))

function runTimer(miles)
  easyPace = 60 * 8 + 15
  fastPace = 60 * 7 + 12
  return miles > 2 ? 2easyPace + (miles - 2) * fastPace
end

println(runTimer(5))
