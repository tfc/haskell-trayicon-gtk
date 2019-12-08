import           Graphics.UI.Gtk
import qualified Graphics.UI.Gtk.Display.StatusIcon as I


main = do
  initGUI
  icon <- statusIconNewFromStock stockQuit
  statusIconSetVisible icon True
  menu <- mkmenu icon
  mainGUI

mkmenu s = do
  m <- menuNew
  return m
