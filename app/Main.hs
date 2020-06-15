module Main where

import Lib

numbers1 = 1 : map (+ 1) numbers1

main :: IO ()
main = do
  -- Task 1 --
  print "Task 1"
  let tree = bft [1 .. 8]
  print tree
  let evenNodes = getEvenNodes tree
  print evenNodes
  -- Task 2 --
  print "Task 2"
  print (take 10 numbers1)
  let sum = scanl1 (+) numbers1
  print (take 10 sum)
