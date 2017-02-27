{-# LANGUAGE OverloadedStrings #-}

module Interpreter
  ( notebookInterpreter
  ) where

import Types
import DisplayTypes
import Displayable
import Control.Exception
import Control.Monad.Trans
import Control.Monad
import Utils
import Data.Text (Text)
import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import System.IO
import System.Process
import GHC.IO.Handle

getCellText :: Cell -> Text
getCellText c = case cellType c of
  TextCell    -> T.unlines $ map (mappend "-- ") (T.lines $ cellContent c)
  CodeCell    -> cellContent c

formatNotebook :: Notebook -> Text
formatNotebook = T.unlines . map getCellText . cells

writeNotebook :: State -> Notebook -> IO ()
writeNotebook s nb = T.writeFile (filepath nb) $ formatNotebook nb

loadNotebook :: State -> IO ()
loadNotebook s = hPutStrLn (ghciInput s) ":r"

writeConsole :: State -> Notebook -> IO ()
writeConsole s n = do
  hPutStrLn (ghciInput s) (console n)
  hFlush (ghciInput s)

readConsole :: State -> IO String
readConsole s = clearHandle (ghciOutput s)

notebookInterpreter :: Notebook -> State -> IO (Either String Notebook)
notebookInterpreter n s = do
  writeNotebook s n
  loadNotebook s
  writeConsole s n
  x <- readConsole s
  return (Right ( n { console = x } ))
