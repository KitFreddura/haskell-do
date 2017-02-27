{-# LANGUAGE ConstraintKinds, DataKinds, FlexibleContexts, GADTs,
             OverloadedStrings, PatternSynonyms, QuasiQuotes,
             ScopedTypeVariables, TemplateHaskell, TypeOperators,
             ViewPatterns #-}

module DisplayTestFrames where 

import Control.Applicative
import qualified Control.Foldl as L
import qualified Data.Foldable as F
import Data.Proxy (Proxy(..))
import Lens.Family
import Frames
import Frames.CSV 
import Pipes hiding (Proxy)
import qualified Pipes.Prelude as P

tableTypes' rowGen { rowTypeName = "User"
                   , columnNames = ["user id", "age", "gender"
                                   , "occupation", "zip code"]
                   , separator = "|" }
            "app\\data\\ml-100k\\u.user"

movieStream :: Producer User IO ()
movieStream = readTableOpt userParser "app\\data\\ml-100k\\u.user"

loadMovies :: IO (Frame User)
loadMovies = inCoreAoS movieStream

miniUser :: User -> Record '[Occupation, Gender, Age]
miniUser = rcast

-- to get a record run in the repl
-- import qualified Data.Foldable as F 
-- ms <- loadMovies
-- let u = take 1 . F.toList $ fmap miniUser ms 
-- then you can run display u 

