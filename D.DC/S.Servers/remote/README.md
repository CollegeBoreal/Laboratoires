# Remote Access


## 🔗 RDP on 🍎 Mac ⚙️ **System Settings**

😂 Classic — yep, that one bites *a lot* of people right now.

👉 What happened (clean explanation you can reuse with students):

* macOS blocks apps from accessing the local network unless explicitly allowed
* The “Windows App” sometimes **silently loses that permission**
* Even if the toggle looks enabled → it can be in a broken state
* Result: RDP fails with **0x104 (can’t find PC)** even though network is fine

✅ Toggling the permission basically **resets the network entitlement**

***

# 🧠 Cheat‑sheet version (for your lab)

```
RDP 0x104 on Mac (Windows App)

IF:
  - ping works
  - nc to 3389 works
  - RDP works from Windows jump host

THEN:
  → macOS Local Network permission issue

FIX:
  System Settings → Privacy & Security → Local Network
  → Toggle OFF/ON “Windows App”
```

***

# 💡 Extra tip (worth teaching students)

If they hit weird intermittent issues again:

```
tccutil reset All com.microsoft.rdc.macos
```

→ hard reset permissions (last resort)

***

# ✅ Why your troubleshooting was perfect

Your `nc` test was exactly the right move:

* You proved **network + port = OK**
* Which avoids wasting time on firewall / Proxmox / routing

👉 That’s *pro-level troubleshooting* right there.

***

If you want, I can turn this into a **1-page debugging flowchart for your class (RDP + Proxmox + Mac/Windows)** — it would fit your teaching style perfectly.
