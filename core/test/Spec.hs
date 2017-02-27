import Types 
import Interpreter 
import DisplayTypes
import Displayable
import Data.Char
import qualified Data.Text as T 
import Data.Text.Arbitrary
import Data.Aeson
import Test.QuickCheck

-- testing for Displayable instances
instance Arbitrary DisplayType where 
  arbitrary = elements [DisplayText, DisplayHtml]

instance Arbitrary CellType where 
  arbitrary = elements [TextCell, CodeCell]

instance Arbitrary Cell where 
  arbitrary = Cell <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Notebook where 
  arbitrary = Notebook <$> arbitrary <*> arbitrary <*> arbitrary
              <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary
              <*> arbitrary

instance Arbitrary Display where 
  arbitrary = Display <$> arbitrary <*> arbitrary

genTextDisplay :: Gen Display
genTextDisplay = Display <$> return DisplayText <*> arbitrary

showIsEncode :: Display -> Bool 
showIsEncode d = show (toEncoding d) == show d 

main :: IO ()
main = quickCheck showIsEncode

