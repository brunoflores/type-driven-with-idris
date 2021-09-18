module Main

-- Required by usleep
import System

import Data.String

readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input)
    then pure (Just (stringToNatOrZ input))
    else pure Nothing

total countDown : (secs : Nat) -> IO ()
countDown Z = putStrLn "Lift off!"
countDown (S secs) = do
  putStrLn (show (S secs))
  usleep 1000000
  countDown secs

partial countDowns : IO ()
countDowns = do
  putStr "Enter starting number: "
  Just startNum <- readNumber
    | Nothing => do putStrLn "Invalid input"
                    countDowns
  countDown startNum
  putStr "Another (y/n)? "
  yn <- getLine
  if yn == "y" then countDowns
               else pure ()
