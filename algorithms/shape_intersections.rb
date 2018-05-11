# Note that overlapping is slightly more complex in that you also have to check if one contains the other.
# So here we're just covering intersections

def rectangles_intersect?(first_rectangle, second_rectangle)
  bl_x1, bl_y1, tr_x1, tr_y1 = first_rectangle
  bl_x2, bl_y2, tr_x2, tr_y2 = second_rectangle
  # https://www.hackerearth.com/practice/notes/how-to-check-if-two-rectangles-intersect-or-not/
  # Given two rectangles R1 and R2 . It is easy to visualize that the given two rectangles can not be intersect if one of the following conditions is true.
  #
  # Condition 1: When left edge of R1 is on the right of R2's right edge. ( That is , R1 is completely on the right of R2).
  #
  # Condition 2: When right edge of R1 is on the left of R2's left edge. ( That is , R1 is completely on the left of R2).
  #
  # Condition 3: When top edge of R1 is on bottom of R2's bottom edge ( That is , R1 is completely under R2).
  #
  # Condition 4: When bottom edge of R1 is on top of R2's top edge ( That is , R1 is completely over R2).
end

def circles_intersect?(circle_1, circle_2)
  x1, y1, r1 = circle_1
  x2, y2, r2 = circle_2

  # pythagorean theorem here
  distance_between_centers = Math.sqrt((x1 - x2)**2 + (y1 - y2)**2)

  if distance_between_centers == r1 + r2
    return 'touch'
  elsif distance_between_centers > r1 + r2
    return false
  else
    return true
  end
end

#https://www.topcoder.com/community/data-science/data-science-tutorials/geometry-concepts-line-intersection-and-its-applications/
# Assuming a straight line here
def get_slope_and_intercept(x1, y1, x2, y2)
  x_delta = x2 - x1
  y_delta = y2 - y2
  slope = y_delta.to_f / x_delta.to_f
  intercept = y1 - (slope * x1)
end

# Use get_slope_and_intercept as necessary
# solve
def line_intersection?(slope_1, intercept_1, slope_2, intercept_2)

end

# Assuming here that the polygons are 'drawn' in the order their points are received.
def polygons_intersect?(p1_points, p2_points)
  # find if there's an intersection between the edges of the two polygons.
  #   # For #1, use bounding boxes to shortlist the regions to be tested. If the polygons are really huge, some kind of spatial hierarchy trees could be used too.
end

def polygons_overlap?(p1_points, p2_points)
  # 1. First find if there's an intersection between the edges of the two polygons.
    # For #1, use bounding boxes to shortlist the regions to be tested. If the polygons are really huge, some kind of spatial hierarchy trees could be used too.
  # 2. If not, then choose any one point of the first polygon and test whether it is fully inside the second.
  # 3. If not, then choose any one point of the second polygon and test whether it is fully inside the first.
  # 4. If not, then you can conclude that the two polygons are completely outside each other.
end
