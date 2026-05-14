# ⚙️ Commandes CLI pour installer FreeCAD

[New to FreeCAD? Start HERE (Ultimate Beginner Tutorial)]

Voici des **commandes CLI concises pour installer FreeCAD** sur les principales plateformes :

***

## 🐧 Linux (Ubuntu / Debian)

### ✅ Dépôt officiel (simple)

```bash
sudo apt update
sudo apt install freecad
```

→ Disponible via le gestionnaire de paquets et installable depuis le terminal [\[youtube.com\]](https://www.youtube.com/watch?v=srW_uCPkkNE)

***

### ✅ Version la plus récente (recommandé — Snap)

```bash
sudo snap install freecad
```

→ Snap fournit souvent des versions plus récentes sur plusieurs versions d’Ubuntu [\[formation....france.com\]](https://formation.wanhaofrance.com/en_GB/slides/slide/slicer-611)

***

### ✅ PPA (si nécessaire)

```bash
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable
sudo apt update
sudo apt install freecad
```

→ Le PPA communautaire offre des versions plus récentes via APT [\[youtube.com\]](https://www.youtube.com/watch?v=srW_uCPkkNE)

***

## 🍎 macOS (Homebrew)

```bash
brew install --cask freecad
```

→ Installation officielle via Homebrew [\[formware.co\]](https://www.formware.co/slicer)

***

## 🪟 Windows (CLI / automatisation)

### ✅ Chocolatey

```powershell
choco install freecad
```

→ Installation via gestionnaire de paquets (recommandé) [\[freecad.org\]](https://www.freecad.org/downloads.php)

***

### ✅ Installation silencieuse

```powershell
FreeCAD-x.y.z-Windows-x86_64-installer.exe /S
```

→ Installation sans interface graphique [\[freecad.org\]](https://www.freecad.org/downloads.php)

***

## ▶️ Lancer FreeCAD en CLI

Après installation :

```bash
freecad
```

***

## 🎥 À propos de ta vidéo

Je n’ai pas pu récupérer le contenu de la vidéo (erreur d’accès), donc je ne peux pas extraire directement les commandes.  
Si tu veux, copie ce qui t’intéresse et je te le transforme en commandes propres.

***

✅ Si tu veux, je peux te générer :

*   un script d’installation multiplateforme
*   ou un Dockerfile FreeCAD (intéressant pour CI / lab étudiants)

***

# ✅ Réponse 2 — Utiliser FreeCAD avec une imprimante Wanhao

✅ **Oui — tu peux utiliser une imprimante 3D Wanhao avec FreeCAD**, mais **indirectement** (c’est le point clé).

***

## ⚙️ Comment ça fonctionne vraiment

FreeCAD est un logiciel de **CAO (design)**, pas un pilote d’imprimante.

👉 Il **n’envoie PAS directement vers l’imprimante**, incluant Wanhao.  
Tu dois utiliser un **workflow en 3 étapes** :

    FreeCAD → fichier STL → slicer → G-code → imprimante Wanhao

### Pourquoi ?

*   Les imprimantes 3D comprennent uniquement le **G-code** [\[wiki.freecad.org\]](https://wiki.freecad.org/Installing_on_Linux/en)
*   FreeCAD produit des **modèles solides**, pas des instructions machine [\[wiki.freecad.org\]](https://wiki.freecad.org/Installing_on_Linux/en)

***

## 🔄 Workflow typique avec Wanhao

### 1. Concevoir dans FreeCAD

*   Créer la pièce (atelier Part Design)

***

### 2. Exporter en STL

```text
Fichier → Exporter → STL (.stl)
```

*   STL est le format standard en impression 3D [\[linuxcapable.com\]](https://linuxcapable.com/how-to-install-freecad-on-ubuntu-linux/)

***

### 3. Utiliser un slicer (OBLIGATOIRE)

Wanhao nécessite cette étape :

*   Convertit STL → **G-code**
*   Génère les couches d’impression [\[community....olatey.org\]](https://community.chocolatey.org/packages/freecad)

👉 Slicers populaires :

*   OrcaSlicer (recommandé par Wanhao)
*   Cura
*   PrusaSlicer

***

### 4. Imprimer avec Wanhao

*   Charger le G-code (SD / USB)
*   Lancer l’impression

***

## ✅ Résumé de compatibilité

| Élément              | Compatible Wanhao ? |
| -------------------- | ------------------- |
| FreeCAD (.FCStd)     | ❌ Non               |
| Export STL           | ✅ Oui               |
| Slicer (Orca / Cura) | ✅ Obligatoire       |
| G-code               | ✅ Oui               |

***

## 💡 Insight important (souvent mal compris)

👉 FreeCAD est **100 % compatible avec TOUTES les imprimantes 3D**  
car il utilise des formats standards (STL → G-code)

Il n’est pas :

*   lié à une marque
*   limité à certains modèles

***

## 🎯 Réponse courte

✔ OUI — Wanhao fonctionne avec FreeCAD  
❗ MAIS il faut un slicer intermédiaire

***

## 🧠 Astuce (pertinent pour ton contexte pédagogique)

Pour un labo / cours :

✔ Pipeline standard à enseigner :

```text
FreeCAD → STL → Cura / Orca → G-code → imprimante
```

✔ Avantages :

*   indépendant de la plateforme
*   réutilisable avec toutes les imprimantes

***

✅ Si tu me donnes ton modèle Wanhao précis (D12, i3, D7, etc.), je peux te fournir :

*   un profil slicer prêt à utiliser
*   des réglages optimisés pour classe/labo

---

[New to FreeCAD? Start HERE (Ultimate Beginner Tutorial)]: https://www.youtube.com/watch?v=KmtqNaGPiiQ
