# Rapport d'Incident - Simulation SOC

**Auteur** : Gianni Giudice  
**Date** : 19/05/2025  
**Type de projet** : Personnel – Simulation d'une détection SOC  
**Outil** : Observateur d'événements Windows (`eventvwr.msc`)  
**ID d'événement** : 4625 (Échec de connexion)

---

## 🎯 Objectif

Simuler une tentative de connexion échouée sur un compte local Windows pour observer les journaux de sécurité, comme le ferait un analyste SOC de niveau 1.

---

## 🔧 Méthode

1. Création d'un utilisateur factice `test_soc`.
2. Définition d’un mot de passe.
3. Simulation de plusieurs tentatives de connexion avec mot de passe incorrect.
4. Lecture des logs via `eventvwr.msc`, filtre sur l’ID **4625** (échec de logon).
5. Récupération des détails de l’événement et capture d’écran.

---

## 📝 Détail de l’événement détecté

| Champ | Valeur |
|-------|--------|
| **ID d'événement** | 4625 |
| **Type d’ouverture de session** | 2 (interactif/local) |
| **Nom du compte visé** | `test_soc` |
| **Nom de l’ordinateur** | `DESKTOP-FL1JPQK` |
| **Raison de l’échec** | Nom d’utilisateur inconnu ou mot de passe incorrect |
| **Processus appelant** | `C:\Windows\System32\svchost.exe` |
| **Horodatage** | 19/05/2025 16:13:46 |

---

## 🖼️ Capture d’écran

![Capture Echec Evenement Logon](https://github.com/user-attachments/assets/9c7dd186-46ff-4688-8207-9cf37341fb02)


---

## ✅ Conclusion

Ce test montre que l’audit des événements de connexion sous Windows permet de détecter les tentatives échouées de connexion. Un analyste SOC surveille ce type d’événement via un SIEM pour repérer :
- des tentatives de brute force,
- des comptes testés automatiquement,
- ou des accès non autorisés.

---

## 🔄 Possibilités d'amélioration

- Centraliser ces logs dans un SIEM (ex : Wazuh, Elastic SIEM)
- Détecter automatiquement les tentatives multiples sur une période courte
- Ajouter une alerte ou une réponse automatisée

