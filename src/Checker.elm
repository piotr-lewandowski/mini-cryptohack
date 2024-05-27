module Checker exposing (..)

import Crypto.HMAC exposing (sha256)
import Tasks exposing (Task)

key : String
key = "this_is_not_that_important"

checkAnswer : Task -> Bool
checkAnswer task = task.solution == getHash task.input
    
getHash : String -> String
getHash s = Crypto.HMAC.digest sha256 key s