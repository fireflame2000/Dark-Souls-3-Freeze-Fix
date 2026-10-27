# Dark Souls III CPU 0 launcher

On some PCs Dark Souls III has issues with CPU 0 and freezes at random. Unticking CPU 0 in the game's affinity fixes it, but Windows forgets that on every launch. This launcher does it for you, only when you use it.

## Symptoms

This launcher may help if:

Dark Souls III freezes completely for 5-10 seconds.

FPS is otherwise normal.

The freezing occurs intermittently.

Manually removing CPU 0 from the game's affinity fixes the issue.

## Tested System

CPU: Ryzen 7 5800X3D 
GPU: RTX 5070 Ti 
OS: Windows 11

Your results may vary on other hardware.

## Use

Double-click **Play DS3 (CPU 0 fix).bat** instead of launching the game from Steam. It:

1. starts Dark Souls III through Steam, or uses it if it's already running,
2. waits for the game to appear (up to 2 minutes),
3. takes CPU 0 away from the game,
4. closes itself.

Nothing stays running in the background. The setting lasts until the game closes, so use the launcher each time you play on this PC.

Tip: keep the .bat and .ps1 in the same folder. For a desktop icon, right-click the .bat and choose Send to > Desktop (create shortcut).

## Checking it worked

In Task Manager, open Details, right-click DarkSoulsIII.exe, and choose Set affinity. CPU 0 should be unticked.
