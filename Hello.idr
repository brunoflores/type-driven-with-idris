module Main

data Vect : Nat -> Type -> Type where
  Nil  : Vect Z a
  (::) : a -> Vect k a -> Vect (S k) a

append : Vect n a -> Vect m a -> Vect (n + m) a
append [] y = y
append (x :: z) y = x :: append z y

main : IO ()
main = putStrLn "Hello, World!"
