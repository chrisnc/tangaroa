module Main (main) where

import Control.Monad (forever)
import Network.Socket hiding (recv, recvFrom, send, sendTo)
import Network.Socket.ByteString
import Data.ByteString.Char8 as B

localhost :: HostAddress
localhost = 0x0100007f

port :: PortNumber
port = 10000

maxlen :: Int
maxlen = 8192

main :: IO ()
main = do
  sock <- socket AF_INET Datagram defaultProtocol
  bind sock (SockAddrInet port localhost)
  forever $ do
    msg <- recv sock maxlen
    B.putStrLn msg
