data Format = Number Format
            | Str Format
            | Lit String Format
            | End

{-
 Str (Lit "=" (Number End))
 represents the format string "%s = %d"
-}

PrintfType : Format -> Type
PrintfType (Number rest) = Int -> PrintfType rest
PrintfType (Str rest) = String -> PrintfType rest
PrintfType (Lit _ rest) = PrintfType rest
PrintfType End = String

printfFmt : (fmt : Format) -> (acc : String) -> PrintfType fmt
printfFmt (Number rest) acc = \i => printfFmt rest (acc ++ show i)
printfFmt (Str rest) acc = \s => printfFmt rest (acc ++ s)
printfFmt (Lit str rest) acc = printfFmt rest (acc ++ str)
printfFmt End acc = acc

toFormat : List Char -> Format
toFormat [] = End
toFormat ('%' :: 'd' :: rest) = Number (toFormat rest)
toFormat ('%' :: 'a' :: rest) = Str (toFormat rest)
toFormat ('%' :: rest) = Lit "%" (toFormat rest)
toFormat (c :: rest) = case toFormat rest of
                            Lit str rest' => Lit (strCons c str) rest'
                            rest' => Lit (strCons c "") rest'

printf : (fmt : String) -> PrintfType (toFormat (unpack fmt))
