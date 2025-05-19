# Rapport d'Incident - Simulation SOC

**Auteur** : Gianni Giudice

**Date** : 19/05/2025

**Type de projet** : Personnel – Simulation d'une détection SOC (niveau 1)

**Outil** : Observateur d'événements Windows (`eventvwr.msc`)

**ID d'événement** : 4625 (Échec de connexion)

---

## 🎯 Objectif

Simuler une attaque de type brute force local sur un poste Windows, observer les événements de sécurité générés, et analyser la séquence comme le ferait un analyste SOC de niveau 1.

---

## 🔧 Méthode

1. Création d'un utilisateur factice `test_soc`.
2. Définition d’un mot de passe simple.
3. Ecécution d'un script PowerShell simulant **10 tentatives de connexion échouées* avec des mots de passe erronés.
4. Lecture des logs via `eventvwr.msc`, filtre sur l’ID **4625** (échec de logon).
5. Extraction des événements récents avec `Get-WinEvent` pour produire une séquence horodatée.
6. Export des logs bruts au format `.evtx`.
---

## 📜 Séquence d'événements

| Tentative | Horodatage         | Compte    | Raison                    |
|-----------|--------------------|-----------|---------------------------|
| 1         | 19/05/2025 17:08:17 | test_soc | Mot de passe incorrect    |
| 2         | 19/05/2025 17:08:16 | test_soc | Mot de passe incorrect    |
| 3         | 19/05/2025 17:08:16 | test_soc | Mot de passe incorrect    |
| 4         | 19/05/2025 17:08:15 | test_soc | Mot de passe incorrect    |
| 5         | 19/05/2025 17:08:15 | test_soc | Mot de passe incorrect    |
| 6         | 19/05/2025 17:08:14 | test_soc | Mot de passe incorrect    |
| 7         | 19/05/2025 17:08:14 | test_soc | Mot de passe incorrect    |
| 8         | 19/05/2025 17:08:13 | test_soc | Mot de passe incorrect    |
| 9         | 19/05/2025 17:08:12 | test_soc | Mot de passe incorrect    |
| 10        | 19/05/2025 17:08:12 | test_soc | Mot de passe incorrect    |


---

## 📂 Fichiers fournis

- `4625_logs.evtx` : export brut des événements 4625
- `simulate_4625.ps1` : script PowerShell utilisé pour simuler les tentatives

---

## 🖼️ Capture d’écran

![Capture Evenements 4625 Bruteforce](https://github.com/user-attachments/assets/628378f4-e769-4103-b322-e1fd5a9893f4)

---

## 🚨 Hypothèse d’alerte SOC

Un SIEM correctement configuré pourrait déclencher une alerte de type :

> **Nom** : Tentatives de connexion échouées en rafale  
> **Condition** : ≥5 événements 4625 sur un même compte en < 2 minutes  
> **Gravité** : Moyenne  
> **Action recommandée** : ouverture de ticket, blocage du compte, analyse complémentaire

---

## ✅ Conclusion

Ce test montre comment un analyste SOC peut détecter un comportement anormal en corrélant une série d'événements 4625 sur une période courte.  
L'analyse met en lumière :
- la pertinence de la journalisation Windows,
- l'utilité des règles de corrélation dans un SIEM,
- et l'importance de documenter la chronologie des événements.

---

## 🔄 Possibilités d'amélioration

- Automatiser la détection de ce comportement avec une règle dans un SIEM (Wazuh, Elastic, Sentinel…)
- Ajouter une alerte avec escalade automatique
- Étendre le test avec une **connexion réussie après les échecs** pour simuler une prise de contrôle

