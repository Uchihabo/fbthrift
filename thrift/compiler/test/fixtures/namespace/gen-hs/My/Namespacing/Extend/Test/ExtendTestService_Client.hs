{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------

module My.Namespacing.Extend.Test.ExtendTestService_Client(check) where
import My.Namespacing.Test.HsTestService_Client
import Data.IORef
import Prelude ( Bool(..), Enum, Float, IO, Double, String, Maybe(..),
                 Eq, Show, Ord,
                 concat, error, fromIntegral, fromEnum, length, map,
                 maybe, not, null, otherwise, return, show, toEnum,
                 enumFromTo, Bounded, minBound, maxBound,
                 (.), (&&), (||), (==), (++), ($), (-), (>>=), (>>))

import Control.Applicative (ZipList(..), (<*>))
import Control.Exception
import Control.Monad ( liftM, ap, when )
import Data.ByteString.Lazy (ByteString)
import Data.Functor ( (<$>) )
import Data.Hashable
import Data.Int
import Data.Maybe (catMaybes)
import Data.Text.Lazy.Encoding ( decodeUtf8, encodeUtf8 )
import qualified Data.Text.Lazy as LT
import Data.Typeable ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector
import Test.QuickCheck.Arbitrary ( Arbitrary(..) )
import Test.QuickCheck ( elements )

import Thrift hiding (ProtocolExnType(..))
import qualified Thrift (ProtocolExnType(..))
import Thrift.Types
import Thrift.Arbitraries

import qualified My.Namespacing.Test.Hsmodule_Types as Hsmodule_Types


import My.Namespacing.Extend.Test.Extend_Types
import My.Namespacing.Extend.Test.ExtendTestService
seqid = newIORef 0
check (ip,op) arg_struct1 = do
  send_check op arg_struct1
  recv_check ip
send_check op arg_struct1 = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessage op ("check", M_CALL, seqn) $
    write_Check_args op (Check_args{check_args_struct1=arg_struct1})
  tFlush (getTransport op)
recv_check ip =
  readMessage ip $ \(fname,mtype,rseqid) -> do
    when (mtype == M_EXCEPTION) $ readAppExn ip >>= throw
    res <- read_Check_result ip
    return $ check_result_success res