module Display where

class Display a where 
  display :: a -> String


-- instances of Display for things which will just call Show
instance Display Bool where
  display = show

instance Display Char where
  display = show 

instance Display Int where 
  display = show 

instance Display Integer where
 display = show

instance Display Float where
  display = show

instance Display Double where 
  display = show

instance Display Ordering where 
  display = show 

instance Display Word where 
  display = show

instance Display () where 
  display = show 

instance (Show a) => Display [a] where
  display = show 

instance (Show a) => Display (Maybe a) where 
  display = show 



