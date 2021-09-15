import Data.Vect

total insert : Ord element => (x : element) -> (xsSorted : Vect k element) -> Vect (S k) element
insert x [] = [x]
insert x (y :: xs) = case x < y of
                          False => y :: insert x xs
                          True => x :: y :: xs

total insSort : Ord element => Vect n element -> Vect n element
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                        insert x xsSorted
