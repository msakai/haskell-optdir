{-# LANGUAGE CPP #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Data.OptDir
-- Copyright   :  (c) Masahiro Sakai 2012
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  masahiro.sakai@gmail.com
-- Stability   :  stable
-- Portability :  non-portable
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
import Data.Generics hiding (Generic)
import Data.Hashable
import GHC.Generics

{-|
The 'OptDir' type represents optimization directions.
-}
data OptDir
  = OptMin -- ^ minimization 
  | OptMax -- ^ maximization
  deriving (Bounded, Enum, Eq, Data, Ord, Read, Show, Ix, Generic, Typeable)

instance Hashable OptDir where hashWithSalt = hashUsing fromEnum

#if !MIN_VERSION_hashable(1,2,0)
-- Copied from hashable-1.2.0.7:
-- Copyright   :  (c) Milan Straka 2010
--                (c) Johan Tibell 2011
--                (c) Bryan O'Sullivan 2011, 2012

-- | Transform a value into a 'Hashable' value, then hash the
-- transformed value using the given salt.
--
-- This is a useful shorthand in cases where a type can easily be
-- mapped to another type that is already an instance of 'Hashable'.
-- Example:
--
-- > data Foo = Foo | Bar
-- >          deriving (Enum)
-- >
-- > instance Hashable Foo where
-- >     hashWithSalt = hashUsing fromEnum
hashUsing :: (Hashable b) =>
             (a -> b)           -- ^ Transformation function.
          -> Int                -- ^ Salt.
          -> a                  -- ^ Value to transform.
          -> Int
hashUsing f salt x = hashWithSalt salt (f x)
{-# INLINE hashUsing #-}
#endif
