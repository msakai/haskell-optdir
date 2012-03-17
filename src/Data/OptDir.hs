{-# LANGUAGE DeriveDataTypeable #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Data.OptDir
-- Copyright   :  (c) Masahiro Sakai 2012
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  masahiro.sakai@gmail.com
-- Stability   :  stable
-- Portability :  portable
--
-- The OptDir type for representing optimization directions.
--
-----------------------------------------------------------------------------

module Data.OptDir
  (
    OptDir (..)
  ) where

import Data.Ix
import Data.Typeable
import Data.Generics

{-|
The 'OptDir' type represents optimization directions.
-}
data OptDir
  = OptMin -- ^ minimization 
  | OptMax -- ^ maximization
  deriving (Bounded, Enum, Eq, Data, Ord, Read, Show, Ix, Typeable)
