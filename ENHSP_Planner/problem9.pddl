(define (problem swerve)
  (:domain racetrack)
  (:objects w1 w2 w3 w4 w5 - wall)
  (:init (= (x) 2)
         (= (y) 1)
         (= (vx) 0)
         (= (vy) 0)
         (= (ax w1) 0)
         (= (ay w1) 0)
         (= (bx w1) 8)
         (= (by w1) 0)
         (= (ax w2) 8)
         (= (ay w2) 0)
         (= (bx w2) 8)
         (= (by w2) 8)
         (= (ax w3) 0)
         (= (ay w3) 8)
         (= (bx w3) 8)
         (= (by w3) 8)
         (= (ax w4) 0)
         (= (ay w4) 0)
         (= (bx w4) 0)
         (= (by w4) 8)
         (= (ax w5) 4)
         (= (ay w5) 0)
         (= (bx w5) 4)
         (= (by w5) 5)
  )
  (:goal (and (>= (x) 4)
         (<= (x) 5)
         (= (y) 1)
         (= (vx) 0)
         (= (vy) 0)
)))