data Bool = True | False

data Direction = North
               | East
               | South
               | West

turnClockwise : Direction -> Direction
turnClockwise North = East
turnClockwise East = South
turnClockwise South = West
turnClockwise West = North

||| Represents shapes
data Shape = ||| A triangle, with its base length and height
             Triangle Double Double
           | ||| A rectangle, with its length and height
             Rectangle Double Double
           | ||| A circle, with its radius
             Circle Double

%name Shape shape, shape1, shape2

area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

-- Recursive type
data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

%name Picture pic, pic1, pic2

pictureArea : Picture -> Double
pictureArea (Primitive shape) = area shape
pictureArea (Combine pic pic1) = pictureArea pic + pictureArea pic1
pictureArea (Rotate _ pic) = pictureArea pic
pictureArea (Translate _ _ pic) = pictureArea pic

-- Generic type
data BSTree : Type -> Type where
  Empty : Ord e => BSTree e
  Node : Ord e => (left : BSTree e) -> (val : e) -> (right : BSTree e) -> BSTree e

total insert : e -> BSTree e -> BSTree e
insert x Empty = Node Empty x Empty
insert x (Node left y right) = case compare x y of
                                    LT => Node (insert x left) y right
                                    EQ => Node left y right
                                    GT => Node left y (insert x right)
