module Main

StringOrInt : Bool -> Type
StringOrInt x = case x of
                     True => Int
                     False => String

getStringOrInt : (x : Bool) -> StringOrInt x
getStringOrInt x = case x of
                        True => 42
                        False => "Forty two"

valToString : (x : Bool) -> StringOrInt x -> String
valToString x val = case x of
                         True => ?xtrueType
                         False=> val

main : IO ()
main = putStrLn "Hello, World!"
