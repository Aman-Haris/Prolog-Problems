;
; Problem 1: move personal between locations
;
; Author: Aman Haris
;
(define (problem problem1)
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
      cc1
      hilly
      flat
      mountainous
      eb1
      eb2
      eb3
      c1
      c2
      e1
      e2
      e3
      e4
      p1
      p2
      so1
      so2
      so3
  )

  (:init
        (grid_number g1)
        (grids 9)
        (command_centre c1c gn3 flat)
        (engineering_bay eb1 gn1 flat)
        (commander c1 gn3)
        (engineer e1 gn3)
        (pilot p1 gn3)
        (science_officer so1 gn3)
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
          (engineer e1 gn4)
          (pilot p1 gn5)
          (science_officer so1 gn6)
      )
  )
)