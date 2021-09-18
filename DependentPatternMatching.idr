import Data.String

StringOrInt : Bool -> Type
StringOrInt False = String
StringOrInt True = Int

valToString : (isInt : Bool) -> StringOrInt isInt -> String
valToString False x = trim x
valToString True x = cast x
