module Main

import Data.Vect
import System.REPL
import Data.String

infixr 5 .+.

data Schema = SString
            | SInt
            | (.+.) Schema Schema

SchemaType : Schema -> Type
SchemaType SString = String
SchemaType SInt = Int
SchemaType (x .+. y) = (SchemaType x, SchemaType y)

record DataStore where
  constructor MkData
  schema : Schema
  size : Nat
  items : Vect size (SchemaType schema)

items : (store : DataStore) -> Vect (size store) (SchemaType (schema store))
items (MkData _ _ items') = items'

-- addToStore : DataStore -> String -> DataStore
-- addToStore (MkData _ items) newitem = MkData _ (addToData items)
--   where
--     addToData : Vect old String -> Vect (S old) String
--     addToData [] = [newitem]
--     addToData (item :: items) = item :: addToData items

-- data Command = Add String
--              | Get Integer
--              | Quit

-- parseCommand : String -> String -> Maybe Command
-- parseCommand "add" str = Just (Add str)
-- parseCommand "get" val = case all isDigit (unpack val) of
--                               False => Nothing
--                               True => Just (Get (cast val))
-- parseCommand "quit" "" = Just Quit
-- parseCommand _ _ = Nothing

-- parse : (input : String) -> Maybe Command
-- parse input = let (cmd, args) = span (/= ' ') input in
--                   parseCommand cmd (ltrim args)

-- getEntry : Integer -> DataStore -> Maybe (String, DataStore)
-- getEntry pos store = let storeItems = items store in
--                          case integerToFin pos (size store) of
--                               Nothing => Just ("Out of range\n", store)
--                               Just id => Just (index id storeItems ++ "\n", store)

-- processCommand : DataStore -> Command -> Maybe (String, DataStore)
-- processCommand store (Add item) = Just ("ID " ++ show (size store) ++ "\n", addToStore store item)
-- processCommand store (Get pos) = getEntry pos store
-- processCommand store Quit = Nothing

-- processInput : DataStore -> String -> Maybe (String, DataStore)
-- processInput store input = case parse input of
--                                 Nothing => Just ("Invalid command\n", store)
--                                 Just cmd => processCommand store cmd

-- main : IO ()
-- main = replWith (MkData _ []) "Command: " processInput
