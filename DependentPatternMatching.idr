import Data.String

-- StringOrInt : Bool -> Type
-- StringOrInt False = String
-- StringOrInt True = Int

valToString : (isInt : Bool) -> (case isInt of
                                      True => String
                                      False => Int) -> String
valToString False x = cast x
valToString True x = trim x
