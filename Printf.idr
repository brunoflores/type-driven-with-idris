data Format = Number Format
            | Str Format
            | Lit String Format
            | End

{-
 Str (Lit "=" (Number End))
 represents the format string "%s = %d"
-}
