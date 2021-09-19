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
