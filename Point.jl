import Base: show, +
using Printf

struct Point
  x::Float64
  y::Float64
end

function Base.show(io::IO, pt::Point)
  @printf(io, "(x: %d, y: %d)", pt.x, pt.y)
end

function Point(pt::Point)
  return Point(pt.x, pt.y)
end

function +(pt1::Point, pt2::Point)
  return Point(pt1.x + pt2.x, pt1.y + pt2.y)
end

function +(pt1::Point, pt2::Tuple)
  return Point(pt1.x + pt2[1], pt1.y + pt2[2])
end

function +(pt1::Tuple, pt2::Point)
  return Point(pt1[1] + pt2.x, pt1[2] + pt2.y)
end

pt1 = Point(1, 2)
pt2 = Point(pt1)
pt3 = pt1 + pt2
pt4 = pt3 + (1,-1)
pt5 = (-2,-2) + pt4
pt6 = sum((pt1, pt4, pt5))

@show pt3
@show pt6