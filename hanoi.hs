import System.Environment
import Text.Printf

main :: IO ()
main = do
  args <- getArgs
  if length args == 1
    then hanoi (read (args !! 0) :: Int)
    else printf "Usage: hanoi discs\n"

hanoi :: Int -> IO ()
hanoi discs = dohanoi (discs, "from-pole", "to-pole", "work-pole")
dohanoi :: (Int, String, String, String) -> IO ()
dohanoi (discno, from, to, work)
  | discno == 1 = move (discno, from, to)
  | discno > 1 = do
      dohanoi ((discno - 1), from, work, to)
      move (discno, from, to)
      dohanoi ((discno - 1), work, to, from)
  | otherwise = undefined

move :: (Int, String, String) -> IO ()
move (discno, from, to) = printf "Move disc %d from %s to %s.\n" discno from to
