data Vect : Nat -> Type -> Type where
  Nil : Vect Z a
  (::) : (x : a) -> (xs : Vect k a) -> Vect (S k) a

%name Vect xs, ys, zs

append : Vect n e -> Vect m e -> Vect (n + m) e
append [] ys = ys
append (x :: xs) ys = x :: append xs ys
