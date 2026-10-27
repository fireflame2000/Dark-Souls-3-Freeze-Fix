# Dark Souls III CPU 0 launcher

On some PCs Dark Souls III overloads CPU 0 and freezes at random. Unticking CPU 0 in the game's affinity fixes it, but Windows forgets that on every launch. This launcher does it for you, only when you use it.

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
