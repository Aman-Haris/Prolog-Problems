;
; Problem 3: core samples
;
; Author: Aman Haris
;
(define (problem problem3)
  (:domain uninhabited_planet)

  (:objects
      g1
      g2
      g3
      g4
      g5
      g6
      g7
      g8
      g9
      hilly
      flat
      mountainous
      p1
      p2
      so1
      so2
      so3
      drilling
      m1
      cs1
  )

  (:init
        (grid_number g1)
        (grids 9)
        (command_centre c1 gn3 flat)
        (pilot p1 gn3)
        (science_officer so1 gn4)
        (attachment drilling gn4)
        (mech m1 p1 so1 drilling gn4 ?k)
        (core_sample cs1 gn4)
        (location hilly gn1)
        (location flat gn2)
        (location flat gn3)
        (location hilly gn4)
        (location flat gn5)
        (location flat gn6)
        (location mountainous gn7)
        (location mountainous gn8)
        (location mountainous gn9)
  )

  (:goal
      (and
         (core_sample cs1 gn3)
      )
  )
)