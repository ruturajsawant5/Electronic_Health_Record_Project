# 🏥 Cloud Based EHR System

A centralized, secure, cloud-hosted Electronic Health Record (EHR) system designed to streamline medical data handling for patients, doctors, and hospitals. Built using modern web technologies with a focus on encryption, analytics, and accessibility.

---

## 🔧 Features

- 🔐 User Authentication & Role-based Authorization
- 📁 Patient Record Upload/Download (Encrypted)
- 🏥 Hospital & Doctor Management Portal
- 📊 Regional Disease Analytics
- 🧠 Clinical Data Insights for Diagnostics
- ☁️ AWS-based Scalable Storage
- 🔑 Attribute-Based Encryption (ABE)

---

## 🛠️ Tech Stack

**Frontend:**
- React.js
- HTML / CSS
- JavaScript

**Backend:**
- Node.js
- Express.js
- MySQL (auth/user metadata)
- MongoDB (clinical data)

**Cloud Infrastructure:**
- AWS EC2 Instances
- AWS EFS for file storage (NFSv4)
- REST APIs

---

## 📦 Modules

- **User Interface** – Responsive dashboard for patient, hospital, and doctor roles
- **Encryption** – ABE used to secure upload/download of files
- **Decryption** – Handled post-authentication for valid access
- **Analytics** – Disease trends and reports by region
- **Storage** – MongoDB + AWS EFS for hybrid data storage

---
