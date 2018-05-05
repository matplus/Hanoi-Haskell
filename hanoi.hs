import System.Environment
import Text.Printf

main :: IO ()
main = do
  args <- getArgs
  if length args == 1
    then printanswer (hanoi (read (args !! 0) :: Int))
    else printf "Usage: hanoi discs\n"

printanswer :: [String] -> IO ()
printanswer (x:[]) =
  printf "%s\n" x
printanswer (x:xs) = do
  printf "%s\n" x
  printanswer xs

hanoi :: Int -> [String]
hanoi discs = dohanoi (discs, "from-pole", "to-pole", "work-pole")

dohanoi :: (Int, String, String, String) -> [String]
dohanoi (discno, from, to, work)
  | discno == 1  = move (discno, from, to)
  | discno > 1   = dohanoi ((discno - 1), from, work, to) ++ move (discno, from, to) ++ dohanoi ((discno - 1), work, to, from)
  | otherwise    = undefined

move :: (Int, String, String) -> [String]
move (discno, from, to) = ["Move disc " ++ show discno ++ " from " ++ from ++ " to " ++ to ++ "."]
