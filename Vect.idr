import Data.Fin

data Vect : Nat -> Type -> Type where
  Nil : Vect Z a
  (::) : (x : a) -> (xs : Vect k a) -> Vect (S k) a

%name Vect xs, ys, zs

append : Vect n e -> Vect m e -> Vect (n + m) e
append [] ys = ys
append (x :: xs) ys = x :: append xs ys

zip : Vect n a -> Vect n b -> Vect n (a, b)
zip [] ys = []
zip (x :: xs) (y :: ys) = (x, y) :: zip xs ys

index : Fin len -> Vect len e -> e
index FZ (x::_)  = x
index (FS k) (_::xs) = index k xs

tryIndex : {n : _} -> Integer -> Vect n a -> Maybe a
tryIndex i xs = case integerToFin i n of
                     Nothing => Nothing
                     (Just x) => Just (index x xs)
