import Control.Monad
import Data.Monoid
import System.IO

import XMonad

import XMonad.Actions.UpdatePointer

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.NoBorders

import qualified XMonad.StackSet as W

import XMonad.Util.EZConfig

-- Helper functions to fullscreen the window
fullFloat :: Window -> X ()
fullFloat w = windows $ W.float w r
    where r = W.RationalRect 0 0 1 1

tileWin :: Window -> X ()
tileWin w = windows $ W.sink w

fullScreenEventHook :: Event -> X All
fullScreenEventHook (ClientMessageEvent _ _ _ dpy win typ dat) = do
  state <- getAtom "_NET_WM_STATE"
  fullsc <- getAtom "_NET_WM_STATE_FULLSCREEN"
  isFull <- runQuery isFullscreen win
  let remove = 0  -- Constants for the _NET_WM_STATE protocol
      add = 1
      toggle = 2
      ptype = 4  -- The ATOM property type for changeProperty
      action = head dat
  when (typ == state && (fromIntegral fullsc) `elem` tail dat) $ do
    when (action == add || (action == toggle && not isFull)) $ do
         io $ changeProperty32 dpy win state ptype propModeReplace 
                [fromIntegral fullsc]
         fullFloat win
    when (head dat == remove || (action == toggle && isFull)) $ do
         io $ changeProperty32 dpy win state ptype propModeReplace []
         tileWin win
  -- It shouldn't be necessary for xmonad to do anything more with this event
  return $ All False
fullScreenEventHook _ = return $ All True

handleEventHook' = fullScreenEventHook

modMask' = mod4Mask

manageHook' = composeAll
              [ isFullscreen --> doFullFloat
              , className =? "mplayer2" --> doFloat
              ]

dmenu' = "dmenu_run -fn Consolas-7:bold -nb \\#002b36 -nf \\#93a1a1 -sb \\#073642 -sf \\#93a1a1"

config' = withUrgencyHook NoUrgencyHook defaultConfig
          { focusFollowsMouse = False
          , handleEventHook = handleEventHook'
          , layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
          , logHook = updatePointer (Relative 0.5 0.5)
          , modMask = modMask'
          , manageHook = manageHook' <+> manageHook defaultConfig <+> manageDocks
          , normalBorderColor = "#eee8d5"
          , focusedBorderColor = "#dc322f"
          , terminal = "urxvtc"
          }
          `additionalKeysP`
          [ ("<XF86AudioPlay>", spawn "quodlibet --play-pause")
          , ("<XF86AudioStop>", spawn "quodlibet --pause")
          , ("<XF86AudioNext>", spawn "quodlibet --next")
          , ("<XF86AudioPrev>", spawn "quodlibet --previous")
          , ("<XF86AudioLowerVolume>", spawn "amixer set Master 2dB- unmute")
          , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2dB+ unmute")
          , ("<XF86AudioMute>", spawn "amixer set Master toggle")
          , ("M-d", spawn "quodlibet --play-pause")
          , ("M-f", spawn "quodlibet --next")
          , ("M-p", spawn dmenu')
          , ("M-s", spawn "quodlibet --previous")
          ]

pp' = defaultPP { ppVisible = wrap "(" ")"
                , ppLayout = \_ -> ""
                , ppUrgent = wrap "" "*"
                }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar "xmobar" pp' toggleStrutsKey config'
