{-# LANGUAGE OverloadedStrings #-}
module DB where
import Database.MongoDB
import Control.Monad.Reader
import Control.Monad.Trans (liftIO)
import Data.Pool
import Environment
import Data.Bson.Generic
import Database.MongoDB.Query

-- | local connection only. its a bit trickier if you want to connect remote
localPipe :: IO Pipe
localPipe = connect (host "127.0.0.1") -- alternatively "mongo"

-- | Creates a connection pool of mongodb connections
-- normally you would want to have a configuration loaded from a file, etc.
-- for example getPool :: Configuration -> IO (Pool Pipe)
-- Here is doc for mongodb driver https://hackage.haskell.org/package/mongoDB-2.5.0.0/docs/Database-MongoDB-Connection.html
-- Here is doc for data.Pool https://hackage.haskell.org/package/resource-pool-0.2.3.2/docs/Data-Pool.html
getPool :: IO (Pool Pipe)
getPool = createPool localPipe close 1 300 5


-- | This runs a Db action https://hackage.haskell.org/package/mongoDB-2.5.0.0/docs/Database-MongoDB.html
-- Against the DB.
-- Note that "admin" can be any db name you want to access
run :: Action IO a -> DarrensEnvironment a
run a = do
    pool <- getDbPool -- see the environment.hs file
    liftIO $ withResource pool (\pipe -> access pipe master "admin" a)


-- TODO -- probably in a different file with DB accesses
-- acitons for inserting user/ customers/ list them
-- you can find example here: https://hackage.haskell.org/package/mongoDB-2.5.0.0/docs/Database-MongoDB.html


-- | method for inserting a user into the db. you should use the above run command and a specific action
-- check the datatype for collection. It's a text for the collection name
-- https://hackage.haskell.org/package/mongoDB-2.5.0.0/docs/Database-MongoDB-Query.html#g:4
insertSomething :: String -> Collection -> DarrensEnvironment ObjectId
insertSomething = undefined

-- | your own method by need