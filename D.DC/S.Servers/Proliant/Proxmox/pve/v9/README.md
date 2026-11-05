# 🔐 Proxmox VE – Réinitialiser le mot de passe root à l'aide de GRUB

## 🎯 Objectif

Réinitialiser le mot de passe du compte :

```text
root
```

ou :

```text
root@pam
```

sans réinstaller Proxmox.

---

## Étape 1 – Redémarrer le serveur

Redémarrer le serveur Proxmox.

Lorsque le menu **GRUB** apparaît, sélectionner :

```text
Proxmox VE GNU/Linux
```

---

## Étape 2 – Modifier temporairement le démarrage

Appuyer sur :

```text
e
```

pour éditer l'entrée GRUB.

---

## Étape 3 – Ajouter un shell root

Repérer la ligne commençant par :

```text
linux /boot/vmlinuz...
```

Ajouter à la fin :

```text
init=/bin/bash
```

Exemple :

```text
linux /boot/vmlinuz-7.x.x-pve root=/dev/mapper/pve-root ro quiet init=/bin/bash
```

---

## Étape 4 – Démarrer le système

Appuyer sur :

```text
Ctrl + X
```

ou :

```text
F10
```

Le système démarre directement dans un shell root.

---

## Étape 5 – Monter le système en lecture-écriture

Par défaut, la racine est souvent montée en lecture seule.

Exécuter :

```bash
mount -o remount,rw /
```

Vérifier :

```bash
mount | grep " / "
```

Résultat attendu :

```text
rw
```

et non :

```text
ro
```

---

## Étape 6 – Changer le mot de passe root

Exécuter :

```bash
passwd root
```

Entrer le nouveau mot de passe :

```text
New password:
Retype new password:
```

Résultat attendu :

```text
passwd: password updated successfully
```

---

## Étape 7 – Sauvegarder les modifications

```bash
sync
```

---

##
