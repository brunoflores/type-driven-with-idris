module Main

printLength : IO ()
printLength = do putStr "Input string: "
                 input <- getLine
                 let len = length input
                 putStrLn (show len)

main : IO ()
main = do
  putStr "Enter your name: "
  x <- getLine
  putStrLn ("Hello " ++ x ++ "!")
