module Lib
    (bft, getEvenNodes, evenNodesHelper
    ) where

import Data.List

data BTree a = Empty | Branch a (BTree a) (BTree a) deriving (Show)

bft :: [a] -> BTree a
bft xs = head nodes
  where
    nodes =
      zipWith
        g
        (map Just xs ++ repeat Nothing)
        (pairs $ tail nodes)
    g (Just x) (lt, rt) = Branch x lt rt
    g Nothing _ = Empty
    pairs ~(a : ~(b : c)) = (a, b) : pairs c

getEvenNodes :: (Integral a) => BTree a -> [a]
getEvenNodes = evenNodesHelper []

evenNodesHelper :: (Integral a) => [a] -> BTree a -> [a]
evenNodesHelper xs Empty = xs
evenNodesHelper xs (Branch x l r) =
  let left = evenNodesHelper xs l
      children = evenNodesHelper left r
   in if even x then x : children else children
 
