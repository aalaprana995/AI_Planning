;; A simplified version of the racetrack domain. In this formulation,
;; the disjunctive precondition has been split into one action for each
;; case. The domain is specialised to the problem with a single wall,
;; and it is also missing the special cases for a vertical move.

(define (domain racetrack-simplified)
  (:requirements :strips :typing :fluents)

  (:types wall)
	
  (:functions
   ;; state of the car (position and velocity)
   (x) (y) (vx) (vy)
   ;; location of the wall (static):
   (ax ?w - wall) (ay ?w - wall) (bx ?w - wall) (by ?w - wall)
   ;; precalculated functions for the slope and intercept of the
   ;; infinite line that the wall lies on (also static):

   )
 
  ;; case 1
  (:action move_up
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (not (= (- (y) (* (/ (+ (vy) 1) (vx)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (< (x) (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (> (x) (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx)))) (- (/ (+ (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (vx)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx)))) (- (/ (+ (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx)))) (- (/ (+ (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (vx)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx)))) (- (/ (+ (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx)))) (- (/ (+ (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (vx))))(- (/ (+ (vy) 1) (vx)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (vx))
                 (increase (y) (+ (vy) 1))
                 (increase (vy) 1)
            )
    )

   ;; case 2
  (:action move_down
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (not (= (- (y) (* (/ (- (vy) 1) (vx)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (< (x) (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (> (x) (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx)))) (- (/ (- (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (vx)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx)))) (- (/ (- (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx)))) (- (/ (- (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (+ (vx) 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx)))) (- (/ (- (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx)))) (- (/ (- (vy) 1) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (vx))))(- (/ (- (vy) 1) (vx)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (- vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (- vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (vx))
                 (increase (y) (- (vy) 1))
                 (increase (vy) -1)
            )
    )


;; case 3
  (:action move_right
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ (vx) 1))) (not (= (- (y) (* (/ (vy) (+ (vx) 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ (vx) 1))) (< (x) (ax ?w)) (< (+ (x) (+ (vx) 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ (vx) 1))) (> (x) (bx ?w)) (> (+ (x) (+ (vx) 1)) (bx ?w)))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1)))) (- (/ (vy) (+ (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (+ (vx) 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1)))) (- (/ (vy) (+ (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1)))) (- (/ (vy) (+ (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (+ (vx) 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1)))) (- (/ (vy) (+ (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1)))) (- (/ (vy) (+ (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (+ (vx) 1))))(- (/ (vy) (+ (vx) 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (vy)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (vy)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 0)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 0)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (+ vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (+ vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (+ (vx) 1))
                 (increase (y) (vy))
                 (increase (vx) 1)
            )
    )
    
    
    
;; case 4
  (:action move_left
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- (vx) 1))) (not (= (- (y) (* (/ (vy) (- (vx) 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1))(= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- (vx) 1))) (< (x) (ax ?w)) (< (+ (x) (- (vx) 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1))(= (* (vy) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- (vx) 1))) (> (x) (bx ?w)) (> (+ (x) (- (vx) 1)) (bx ?w)))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1)))) (- (/ (vy) (- (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (- (vx) 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1)))) (- (/ (vy) (- (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1)))) (- (/ (vy) (- (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (- (vx) 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1)))) (- (/ (vy) (- (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1)))) (- (/ (vy) (- (vx) 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (vy) (- (vx) 1))))(- (/ (vy) (- (vx) 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (vy)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (vy)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 0)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 0)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (- vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (- vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (- (vx) 1))
                 (increase (y) (vy))
                 (increase (vx) -1)
            )
    )
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;additional moves;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    


;; case 5
  (:action move_up_right
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (not (= (- (y) (* (/ (+ (vy) 1) (+ vx 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (< (x) (ax ?w)) (< (+ (x) (+ vx 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (> (x) (bx ?w)) (> (+ (x) (+ vx 1)) (bx ?w)))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1)))) (- (/ (+ (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (+ vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1)))) (- (/ (+ (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1)))) (- (/ (+ (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (+ vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1)))) (- (/ (+ (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1)))) (- (/ (+ (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (+ vx 1))))(- (/ (+ (vy) 1) (+ vx 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (+ vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (+ vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (+ vx 1))
                 (increase (y) (+ (vy) 1))
                 (increase (vy) 1)
                 (increase (vx) 1)
            )
    )

  
  
  ;; case 6
  (:action move_down_right
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (not (= (- (y) (* (/ (- (vy) 1) (+ vx 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (< (x) (ax ?w)) (< (+ (x) (+ vx 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) -1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (+ vx 1))) (> (x) (bx ?w)) (> (+ (x) (+ vx 1)) (bx ?w)))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1)))) (- (/ (- (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (+ vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1)))) (- (/ (- (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1)))) (- (/ (- (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (+ vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1)))) (- (/ (- (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1)))) (- (/ (- (vy) 1) (+ vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) -1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (+ vx 1))))(- (/ (- (vy) 1) (+ vx 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) -1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (- vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (- vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (+ vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (+ vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (+ vx 1))
                 (increase (y) (- (vy) 1))
                 (increase (vy) -1)
                 (increase (vx) 1)
            )
    )
    
    
    
   ;; case 7
  (:action move_up_left
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (not (= (- (y) (* (/ (+ (vy) 1) (- vx 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (< (x) (ax ?w)) (< (+ (x) (- vx 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (+ (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (> (x) (bx ?w)) (> (+ (x) (- vx 1)) (bx ?w)))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1)))) (- (/ (+ (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (- vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1)))) (- (/ (+ (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1)))) (- (/ (+ (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (- vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1)))) (- (/ (+ (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1)))) (- (/ (+ (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 1) (- vx 1))))(- (/ (+ (vy) 1) (- vx 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (+ (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (- vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (- vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (- vx 1))
                 (increase (y) (+ (vy) 1))
                 (increase (vy) 1)
                 (increase (vx) -1)
            )
    )

  
  
  ;; case 8
  (:action move_down_left
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (not (= (- (y) (* (/ (- (vy) 1) (- vx 1)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (< (x) (ax ?w)) (< (+ (x) (- vx 1)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 1)) (= (* (- (vy) 1) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (- vx 1))) (> (x) (bx ?w)) (> (+ (x) (- vx 1)) (bx ?w)))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1)))) (- (/ (- (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (- vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1)))) (- (/ (- (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1)))) (- (/ (- (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (- vx 1)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1)))) (- (/ (- (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1)))) (- (/ (- (vy) 1) (- vx 1)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 1)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (- (vy) 1) (- vx 1))))(- (/ (- (vy) 1) (- vx 1)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (- (vy) 1)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 1) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (- vy 1)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (- vy 1)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (- vx 1)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (- vx 1)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (- vx 1))
                 (increase (y) (- (vy) 1))
                 (increase (vy) -1)
                 (increase (vx) -1)
            )
    )
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;none move;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    (:action move_none
   :parameters ()
   :precondition (forall (?w - wall)
                    (or
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 0) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (not (= (- (y) (* (/ (+ (vy) 0) (vx)) (x))) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 0) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (< (x) (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      (and (not (= (- (ax ?w) (bx ?w)) 0)) (not (= (vx) 0)) (= (* (+ (vy) 0) (- (bx ?w) (ax ?w))) (* (- (by ?w) (ay ?w)) (vx))) (> (x) (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx)))) (- (/ (+ (vy) 0) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (> (+ (x) (vx)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx)))) (- (/ (+ (vy) 0) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (x) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx)))) (- (/ (+ (vy) 0) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))) (< (+ (x) (vx)) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx)))) (- (/ (+ (vy) 0) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx)))) (- (/ (+ (vy) 0) (vx)) (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w)))))))
                      (and (not (= (vx) 0)) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (/ (+ (- (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))) (y)) (* (x) (/ (+ (vy) 0) (vx))))(- (/ (+ (vy) 0) (vx)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w)))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (> (+ (y) (+ (vy) 0)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (y) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))) (< (+ (y) (+ (vy) 0)) (+ (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (x)) (- (by ?w) (* (/ (- (by ?w) (ay ?w)) (- (bx ?w) (ax ?w))) (ax ?w))))))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (> (ax ?w) (x)))
                      (and (= (vx) 0) (not (= (- (ax ?w) (bx ?w)) 0)) (< (bx ?w) (x)))
                      ;;vertical wall
                      ;;my condition for vertical wall
                      ;;any move is below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (< y (ay ?w)) (< (+ (y) (+ vy 0)) (ay ?w)))
                      ;;any move is above the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> (by ?w)(ay ?w)) (> y (by ?w)) (> (+ (y) (+ vy 0)) (by ?w)))
                      ;;any move to right of  the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (< x (ax ?w)) (< (+ (x) (vx)) (ax ?w)))
                      ;;any move to below the vertical wall is allowed
                      (and (= (- (bx ?w) (ax ?w)) 0) (> x (bx ?w)) (> (+ (x) (vx)) (bx ?w)))
   
                   )
                 )
   :effect (and  (increase (x) (vx))
                 (increase (y) (+ (vy) 0))
                 (increase (vy) 0)
                 (increase (y) (vy))
            )
    )
  )
