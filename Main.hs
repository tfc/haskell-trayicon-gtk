module Main (Main.main) where

import           Graphics.UI.Gtk
import           Graphics.UI.Gtk.Display.StatusIcon

launchTrayIcon :: IO ()
launchTrayIcon = do
    i <- statusIconNew
    statusIconSetVisible i True


main :: IO ()
main = do
  initGUI
  window <- windowNew
  on window objectDestroy mainQuit
  set window [ containerBorderWidth := 10, windowTitle := "Hello World" ]
  button <- buttonNew
  set button [ buttonLabel := "Hello World" ]
  on button buttonActivated $ do
    putStrLn "A \"clicked\"-handler to say \"destroy\""
    widgetDestroy window
  set window [ containerChild := button ]
  widgetShowAll window
  launchTrayIcon
  mainGUI -- main loop
