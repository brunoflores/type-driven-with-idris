import Data.Vect

data VectUnknown : Type -> Type where
  MkVect : (len : Nat) -> Vect len a -> VectUnknown a

readVect : IO (VectUnknown String)
