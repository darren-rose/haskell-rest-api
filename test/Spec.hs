import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Lib.multiplyByFive" $ do
    it "multiply 5 by 5" $ do
      multiplyByFive 5 `shouldBe` (25 :: Integer)

    it "multiply 7 by 5" $ do
      multiplyByFive 7 `shouldBe` (35 :: Integer)

    it "multiply 17 by 5" $ do
      multiplyByFive 17 `shouldBe` (85 :: Integer)
