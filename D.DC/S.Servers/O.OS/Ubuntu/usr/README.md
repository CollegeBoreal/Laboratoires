

Here’s a clear step-by-step guide to **add a new user with sudo privileges** on Ubuntu 👇

---

### 🧩 1. Create the new user

```bash
sudo adduser 300099999
```
<details>
<summary>❌ numerical UIDs</summary>

```lua
[sudo] password for ubuntu: 
err: To avoid ambiguity with numerical UIDs, usernames which
            consist of only digits are not allowed.
```

</details>

<details>
<summary>✅ Better username</summary>

```lua
info: Adding user `b300099999' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `b300099999' (1001) ...
info: Adding new user `b300099999' (1001) with group `b300099999 (1001)' ...
info: Creating home directory `/home/b300099999' ...
info: Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for b300099999
Enter the new value, or press ENTER for the default
	Full Name []: Moi Moi-Meme
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `b300099999' to supplemental / extra groups `users' ...
info: Adding user `b300099999' to group `users' ...
```

</details>
* Replace `newusername` with the actual username you want.
* You’ll be prompted to create a password and optionally fill in user info.

---

### 🔑 2. Add the user to the `sudo` group

Ubuntu uses the `sudo` group (sometimes called `admin` on older versions) to grant sudo privileges.

```bash
sudo usermod -aG sudo newusername
```

The `-aG` flag means **append** (`a`) the user to the **group** (`G`) named `sudo`.

---

### ✅ 3. Verify the user’s sudo access

Switch to the new user:

```bash
su - newusername
```

Then test sudo:

```bash
sudo whoami
```

If everything is correct, it should print:

```
root
```

---

### 🧱 (Optional) 4. Grant passwordless sudo access

If you want this user to use `sudo` without entering a password (use with caution):

```bash
sudo visudo
```

Then add a line like this at the end:

```
newusername ALL=(ALL) NOPASSWD:ALL
```

---

### 🔒 Summary

| Step | Command                             | Description                            |
| ---- | ----------------------------------- | -------------------------------------- |
| 1    | `sudo adduser newusername`          | Create a new user                      |
| 2    | `sudo usermod -aG sudo newusername` | Add to sudo group                      |
| 3    | `sudo whoami`                       | Verify sudo access                     |
| 4    | `visudo`                            | (Optional) Configure passwordless sudo |
