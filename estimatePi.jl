ε = 1e-10 # floating point accuracy

function factorial(n)
    out = 1
    while(n > 0)
        out *= n
        n -= 1
    end
    return out
end

function numericalPiEstimator()
    constantMultiplicator = 2*sqrt(2) / 9801
    # sum
    seriesSummation = 0
    k = 0
    previousCurr = 0
    curr = 1
    while(abs(curr - previousCurr) > ε)
        previousCurr = curr
        println("k ", k)
        numerator = factorial(4k) * (1103 + 26390*k)
        denominator = factorial(k)^4 * 396^(4*k)
        if numerator < 0 || denominator < 0
            println(numerator, " ", denominator)
        end
        curr = numerator / denominator
        seriesSummation += curr
        println("k $k ", seriesSummation)
        k += 1
    end
    return (constantMultiplicator * seriesSummation)
end

# println(factorial(0), factorial(2), factorial(3))
println(numericalPiEstimator())
println(pi)

# FACTORIAL_TEST_SEQUENCE = [
#     1,
#     1, 
#     2,
#     6, 
#     24,
#     120,
#     720,
#     5040,
#     40320,
#     362880,
#     3628800
# ]

# for (indx, val) in enumerate(FACTORIAL_TEST_SEQUENCE)
#     println("$(indx-1) $val $(factorial(indx-1))")
# end


