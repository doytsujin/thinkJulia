## exercise 1-1
println("Hello, World!") ## type string
println(typeof(`Hello, World!`)) ## type cmd 

# note ++1 or 1++ is invalid syntax in jl
println(-2)
println(+2)

println(02) # 2


## exercise 1-2
function getSeconds(minutes::Int64, seconds::Int64)
  return minutes * 60 + seconds
end

println(getSeconds(42, 42))

function convertToMiles(kilometers)
  return kilometers/1.61
end

println(convertToMiles(10))

function getMileTime(km, min, sec)
  return (convertToMiles(km) / getSeconds(min, sec)) * 3600 
end

println(getMileTime(10, 37, 48))