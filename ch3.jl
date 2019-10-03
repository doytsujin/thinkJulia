# chapter 6


# exercise 6.1
function b(z)
  println(" "^3, z)
  prod = a(z, z)
  println(" "^3, prod)
  prod
end

function a(x, y)
  println(" "^5, x, " ", y)
  x = x + 1
  println(" "^5, x * y)
  x * y
end

function c(x, y, z)
  total = x + y + z
  println(" "^1, total)
  square = b(total)^2
  println(" "^1, square)
  square
end

x = 1
y = x + 1
println(c(x, y + 3, x + y))

# exercise 6.2

function ackermannFn(m, n)
  println(" "^m, m, n)
  if m == 0
    return n + 1
  elseif m > 0 & n == 0
    return ackermannFn(m - 1, 1)
  elseif m > 0 & n > 0
    return ackermannFn(m - 1, ackermannFn(m, n - 1))
  end
end

println(ackermannFn(3, 4))
