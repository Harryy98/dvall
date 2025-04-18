# 🚗 Delete Unoccupied Vehicles Script (`/dvall`)

This script allows admins to clear all unoccupied vehicles from the map with a 15-second countdown and clear on-screen notifications. It's great for cleaning up leftover or abandoned vehicles on your FiveM server.

---

## 📦 Features

- ⏳ 15-second countdown before cleanup
- 🔊 Notification sounds at each countdown stage
- 🧹 Deletes **only unoccupied** vehicles
- ✅ Permissions-based access (`dvall`)
- 📋 Logs usage to a Discord webhook
- 🔔 Uses `ox_lib` for sleek notification popups

---

## 🚀 Installation

1. **Place the script** in your `resources` folder.

2. Add the resource to your `server.cfg`:
   ```cfg
   ensure dvall
   ```

3. **Install [`ox_lib`](https://github.com/overextended/ox_lib)** if you haven't already:
   ```bash
   ensure ox_lib
   ```

---

## 🔒 Permissions

Only users with the `dvall` permission can use the `/dvall` command.

Add permission for a group:
```cfg
add_ace group.admin dvall allow
```

Or for a specific player:
```cfg
add_principal identifier.steam:YOUR_STEAM_HEX dvall allow
```

> 🔐 Replace `YOUR_STEAM_HEX` with the actual Steam hex ID of the player.

---

## 🔧 Configuration

Open `dvall.lua` and configure the following:

### 🔗 Discord Webhook
At the top of the script:
```lua
local webhook = "https://discord.com/api/webhooks/..."
```
Replace with your desired Discord webhook for logging command usage.

---

## 📜 Usage

Admins can type the following command in-game:
```
/dvall
```

The script will:
1. Notify all players of a 15-second timer.
2. Show countdown alerts (10s, 5s, 3s, 1s).
3. Delete all unoccupied vehicles on the map.
4. Log the action in Discord.

---

## 🧠 Credits
- Uses [`ox_lib`](https://github.com/overextended/ox_lib) for notifications
- Notification sounds: Rockstar native frontend
---
