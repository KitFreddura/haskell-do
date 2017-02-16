module Display where

import Data.Functor.Identity

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

instance (Show a) => Display (Identity a) where 
  display = show 

instance (Show a, Show b) => Display (Either a b) where 
  display = show 

-- Thar be tuples here
instance (Show a, Show b) => Display (a, b) where 
  display = show 

instance (Show a, Show b, Show c) => Display (a, b, c) where 
  display = show 

instance (Show a, Show b, Show c, Show d) => Display (a, b, c, d) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e) => Display (a,b,c,d,e) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f) => Display (a,b,c,d,e,f) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g) => Display (a,b,c,d,e,f,g) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h) => Display (a,b,c,d,e,f,g,h) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i) => Display (a,b,c,d,e,f,g,h,i) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j) => Display (a,b,c,d,e,f,g,h,i,j) where 
  display = show

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j, Show k) => Display (a,b,c,d,e,f,g,h,i,j,k) where 
  display = show  

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j, Show k, Show l) => Display (a,b,c,d,e,f,g,h,i,j,k,l) where 
  display = show  

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j, Show k, Show l, Show m) => Display (a,b,c,d,e,f,g,h,i,j,k,l,m) where 
  display = show  

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j, Show k, Show l, Show m, Show n) => Display (a,b,c,d,e,f,g,h,i,j,k,l,m,n) where 
  display = show 

instance (Show a, Show b, Show c, Show d, Show e, Show f, Show g, Show h, Show i, Show j, Show k, Show l, Show m, Show n, Show o) => Display (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o) where 
  display = show 

