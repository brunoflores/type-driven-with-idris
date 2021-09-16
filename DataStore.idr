module Main

import Data.Vect
import System.REPL
import Data.String

data DataStore : Type where
  MkData : (size : Nat) -> (items : Vect size String) -> DataStore

size : DataStore -> Nat
size (MkData size' _) = size'

items : (store : DataStore) -> Vect (size store) String
items (MkData _ items') = items'

addToStore : DataStore -> String -> DataStore
addToStore (MkData _ items) newitem = MkData _ (addToData items)
  where
    addToData : Vect old String -> Vect (S old) String
    addToData [] = [newitem]
    addToData (item :: items) = newitem :: addToData items

data Command = Add String
             | Get Integer
             | Quit

parseCommand : String -> String -> Maybe Command
parseCommand "add" str = Just (Add str)
parseCommand "get" val = case all isDigit (unpack val) of
                              False => Nothing
                              True => Just (Get (cast val))
parseCommand "quit" "" = Just Quit
parseCommand _ _ = Nothing

parse : (input : String) -> Maybe Command
parse input = let (cmd, args) = span (/= ' ') input in
                  parseCommand cmd (ltrim args)

getEntry : Integer -> DataStore -> Maybe (String, DataStore)

processCommand : DataStore -> Command -> Maybe (String, DataStore)
processCommand store (Add item) = Just ("ID " ++ show (size store) ++ "\n", addToStore store item)
processCommand store (Get pos) = getEntry pos store
processCommand store Quit = Nothing

processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store input = case parse input of
                                Nothing => Just ("Invalid command\n", store)
                                Just cmd => processCommand store cmd

main : IO ()
main = replWith (MkData _ []) "Command: " processInput
