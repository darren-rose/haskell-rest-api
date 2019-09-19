module Environment where
import Data.Pool
import Database.MongoDB
import Control.Monad.Reader
import DB

type DarrensEnvironment = ReaderT Environment IO

getDbPool :: DarrensEnvironment (Pool Pipe)
getDbPool =  do
  env <- ask
  return $ dbPool env


-- | You can add here config files, loggers, or whatever you need to keep after initialization
data Environment = Environment {
    dbPool::Pool Pipe
}


-- Forgot to add a method that creates the environment
createEnvironment :: IO Environment
createEnvironment = do 
	pool <- getPool
    return $ Environment pool