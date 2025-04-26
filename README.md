# 🚦 NetInterfaceViewer (bash)

**Auteur** : malboostone
**But** : Afficher la configuration réseau d’une interface choisie, en validant la saisie et sans caractères spéciaux.  

---

## ⚙️ Fonctionnement

1. **Bannière colorée**  
   - Affiche un header rouge pour signaler le début du script.  
2. **Saisie sécurisée**  
   - Invite l’utilisateur à entrer le nom d’une interface (ex. `eth0`, `wlan0`).  
   - Vérifie que le nom ne contient que des caractères alphanumériques.  
   - Vérifie que le fichier `/etc/sysconfig/network-scripts/ifcfg-<interface>` existe.  
   - En cas d’erreur, réaffiche la bannière et un message explicite, puis redemande.  
3. **Affichage de la configuration**  
   - Exécute `ifconfig <interface>`.  
   - Supprime la ligne de titre pour ne montrer que les détails (IP, masque, MAC…).  
   - Affiche une ligne de séparation rouge en fin de sortie.  

---

## 🔧 Personnalisation

- Chemin des configs : `/etc/sysconfig/network-scripts/ifcfg-<iface>` (adaptable selon ta distro).  
- Couleurs et style de la bannière modifiables via les variables `RED` et `RESET`.  
- Pour remplacer `ifconfig`, utilise `ip addr show <iface>` si nécessaire.  

---

## 🚀 Usage

```bash
chmod +x netinterfaceviewer.sh
./netinterfaceviewer.sh
