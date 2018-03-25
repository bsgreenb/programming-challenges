# The purpose of this here is to better understand Dynamic Programming & Memoization.

# Recursive solutions, by definition, are built off of solutions to subproblems.

# Bottom Up approach: Often the most intuitive..  with this approach, you start knowing how to solve the problem with a simple case, e.g. a list with only one element.  When then figure out how to solve the problem for two, then three, then four.  The key is how you can build off the n-1 solution, working off the previous case.

# Top Down Approach.  The top down approach can be more complex since it's less concrete.  But sometimes it's the best way to think about the problem.  In Top-Down Approach, we think about how we can divide the problem for case N into subproblems.  Be careful of overlap between the cases.

# Sheesh, I'm gonna have to see the examples.  Also note that Half and Half approach is the third type, and is used e.g. in Binary Search.

# Dynamic Programming & Memoization: Dynamic programming is mostly about finding the Overlapping sub-problems, and caching their results to avoid repeated work.

# A note on terminology: Some people call top-down dynamic programming "memoization" and only use "dynamic programming" to refer to bottom-up work.  We do not make such a distinction here.  We call both dynamic programming.  But be aware that some people only refer to bottom up as that.

# Memoization

# Fibonacci without memoization
def fibonacci_basic(i)
  return 0 if i == 0
  return 1 if i == 1
  return fibonacci_basic(i - 1) + fibonacci_basic(i - 2)
end


# Fib w/ Top-Down Dynamic Programming aka memoization
def fib_top_down_with_memo(n, fib_results = [])
  if n == 0 || n == 1
    return n
  else
    if fib_results[n]
      return fib_results[n]
    else
      fib_results[n] = fib_with_memo(n-1, fib_results) + fib_with_memo(n-2, fib_results)
      return fib_results[n]
    end
  end
end

# Bottom up dynamic memoization
# we can also take this approach and implement it with bottom-up dynamic programming.
# Think about doing the same things as the recursive memoized approach, but in
# reverse

# First we computer fib(1) and fib(0, which are already known from base cases.
# Then we use those to computer fib(2), then we use prior answers etc.
def fib_bottom_up_with_memo(n)
  return 0 if (n == 0)
  return 1 if (n == 1)

  a = 0
  b = 1
  sum = 0
  i = 2
  # So here we're using an iterative approach to build up.
  while i < n
    c = a + b
    a = b
    b = c
    sum = sum + c if i % 2 == 0
    i = i + 1
  end

  return sum
end

puts fib_bottom_up_with_memo(4 * 1000 * 1000)
