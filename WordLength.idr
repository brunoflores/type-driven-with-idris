allLengths : List String -> List Nat
allLengths [] = []
allLengths (word :: words) = length word :: ?rest
