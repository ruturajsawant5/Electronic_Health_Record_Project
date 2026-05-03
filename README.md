# 🏥 Cloud-Based Electronic Health Record (EHR) System

A centralized, secure, cloud-hosted **Electronic Health Record** system designed to streamline medical data handling across patients, doctors, and hospitals. Built as a college project using modern web technologies with a focus on role-based access control, encrypted file storage, and regional disease analytics.

---

## 📋 Table of Contents

- [Features](#-features)
- [Tech Stack](#️-tech-stack)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Database Schema](#️-database-schema)
- [API Endpoints](#-api-endpoints)
- [Modules](#-modules)
- [Setup & Installation](#-setup--installation)
- [Documentation](#-documentation)

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔐 **Authentication** | JWT-based login/signup with bcrypt password hashing for all user roles |
| 👥 **Role-Based Access** | Separate portals and permissions for Patients, Doctors, Hospitals, and Admins |
| 📁 **File Upload/Download** | Medical records (images, PDFs) uploaded directly to AWS S3 |
| 📊 **Disease Analytics** | City-wise and disease-wise aggregated reports for administrative insights |
| 🏥 **Hospital–Doctor Mapping** | Hospitals register doctors under their organization |
| 📝 **Medical Reports** | Doctors create, update, and delete patient reports with file attachments |
| ☁️ **Cloud Infrastructure** | AWS S3 for scalable file storage with server hosted on AWS EC2 |

---

## 🛠️ Tech Stack

### Frontend
- **React.js** — Single-page application with component-based UI
- **HTML / CSS / JavaScript**
- **Anime.js** — Animations and micro-interactions
- **ScrollReveal** — Scroll-triggered reveal animations

### Backend
- **Node.js** + **Express.js** — RESTful API server
- **Sequelize ORM** — Object-relational mapping for MySQL
- **JSON Web Tokens (JWT)** — Stateless authentication
- **bcrypt.js** — Secure password hashing
- **Multer + Multer-S3** — Multipart file uploads to AWS S3
- **Morgan** — HTTP request logging
- **express-validator** — Input validation and sanitization

### Database
- **MySQL 8.0** — Relational data store for users, reports, and file metadata

### Cloud (AWS)
- **AWS S3** — Medical record file storage (`ehr-g12-record-files` bucket)
- **AWS EC2** — Application server hosting

---

## 🏗 Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     React Frontend                      │
│              (Static Build / Create React App)          │
└────────────────────────┬────────────────────────────────┘
                         │  REST API (JSON)
                         ▼
┌─────────────────────────────────────────────────────────┐
│                  Express.js Backend                     │
│                                                         │
│  ┌───────────┐  ┌────────────┐  ┌────────────────────┐ │
│  │  Routes    │→│ Controllers │→│   Sequelize Models  │ │
│  └───────────┘  └────────────┘  └─────────┬──────────┘ │
│                                            │            │
│  ┌───────────────────────┐                 │            │
│  │  JWT Auth Middleware  │                 │            │
│  │  (per-role guards)    │                 │            │
│  └───────────────────────┘                 │            │
└────────────────────────────────────────────┼────────────┘
                         │                   │
              ┌──────────┘                   │
              ▼                              ▼
┌──────────────────────┐     ┌──────────────────────────┐
│      AWS S3          │     │       MySQL 8.0          │
│  (File Storage)      │     │   (Users, Reports, etc.) │
└──────────────────────┘     └──────────────────────────┘
```

---

## 📂 Project Structure

```
Electronic_Health_Record_Project/
│
├── real-ehr-code-master/          # Backend (Node.js + Express)
│   ├── app.js                     # Application entry point & server config
│   ├── vars.env                   # Environment variables
│   ├── package.json               # Dependencies & scripts
│   │
│   ├── models/                    # Sequelize ORM models
│   │   ├── admin.js               #   Admin user model
│   │   ├── patient.js             #   Patient model (name, email, gender, etc.)
│   │   ├── doctor.js              #   Doctor model (+ occupation field)
│   │   ├── hospital.js            #   Hospital model (name, address, mobile)
│   │   ├── hospital_doctor.js     #   Hospital ↔ Doctor junction table
│   │   ├── report.js              #   Medical report (diseases, medicines, city)
│   │   └── file.js                #   File metadata (S3 key, linked to report)
│   │
│   ├── controllers/               # Business logic
│   │   ├── adminAuth.js           #   Admin auth + analytics (city/disease-wise)
│   │   ├── patientAuth.js         #   Patient signup/login
│   │   ├── doctorAuth.js          #   Doctor signup/login
│   │   ├── hospitalAuth.js        #   Hospital signup/login
│   │   ├── report_doctor.js       #   CRUD reports + S3 file retrieval
│   │   ├── report_patient.js      #   Patient-side report viewing
│   │   └── report_hospital.js     #   Hospital-side report viewing
│   │
│   ├── routes/                    # Express route definitions
│   │   ├── admin.js               #   /api/admin/*
│   │   ├── patient.js             #   /api/patient/*
│   │   ├── doctor.js              #   /api/doctor/*
│   │   ├── hospital.js            #   /api/hospital/*
│   │   ├── report_doctor.js       #   /api/doctor/report/*
│   │   ├── report_patient.js      #   /api/patient/report/*
│   │   └── report_hospital.js     #   /api/hospital/report/*
│   │
│   └── util/                      # Utilities & middleware
│       ├── database.js            #   Sequelize DB connection
│       ├── is-auth-admin.js       #   Admin JWT guard
│       ├── is-auth-doctor.js      #   Doctor JWT guard
│       ├── is-auth-hospital.js    #   Hospital JWT guard
│       └── is-auth-patient.js     #   Patient JWT guard
│
├── real-react-app-master/         # Frontend (React production build)
│   ├── index.html                 # SPA entry point
│   ├── static/                    # Compiled JS, CSS, and media assets
│   ├── assests/                   # Additional stylesheets
│   ├── manifest.json              # PWA manifest
│   └── service-worker.js          # Offline caching service worker
│
├── database/
│   └── data.sql                   # Full MySQL dump (schema + seed data)
│
├── docs/                          # Project documentation
│   ├── Synopsis.pdf               # Project synopsis
│   ├── Report-Part-1.pdf          # Detailed report (Part 1)
│   ├── Report-Part-2.pdf          # Detailed report (Part 2)
│   ├── June - Report EHR .docx   # Monthly progress report
│   └── CLOUD BASED EHR SYSTEM(Sept).pptx  # Presentation slides
│
└── README.md
```

---

## 🗂️ Database Schema

The system uses **6 relational tables** managed by Sequelize ORM:

```
┌──────────────┐       ┌──────────────────┐       ┌──────────────┐
│   patients   │       │     reports      │       │   doctors    │
├──────────────┤       ├──────────────────┤       ├──────────────┤
│ id (PK)      │──┐    │ id (PK)          │   ┌──│ id (PK)      │
│ username     │  │    │ dieseases        │   │  │ username     │
│ password     │  ├───→│ medicines        │←──┤  │ password     │
│ email        │       │ comments         │   │  │ email        │
│ name         │       │ precautions      │   │  │ name         │
│ gender       │       │ city             │   │  │ occupation   │
│ date         │       │ patientId (FK)   │   │  │ gender       │
│ address      │       │ doctorId (FK)    │   │  │ date         │
│ mobile       │       │ hospitalId (FK)  │   │  │ address      │
└──────────────┘       └────────┬─────────┘   │  │ mobile       │
                                │             │  └──────────────┘
                                │             │
                       ┌────────▼─────────┐   │  ┌──────────────────┐
                       │     files        │   │  │hospital_doctors  │
                       ├──────────────────┤   │  ├──────────────────┤
                       │ id (PK)          │   │  │ id (PK)          │
                       │ name (S3 key)    │   │  │ hospitalId (FK)  │
                       │ reportId (FK)    │   │  │ doctorId (FK)    │
                       └──────────────────┘   │  └──────────────────┘
                                              │
                                              │  ┌──────────────┐
                                              └──│  hospitals   │
                                                 ├──────────────┤
                                                 │ id (PK)      │
                                                 │ username     │
                                                 │ password     │
                                                 │ email        │
                                                 │ name         │
                                                 │ address      │
                                                 │ mobile       │
                                                 └──────────────┘

   ┌──────────────┐
   │    admins    │
   ├──────────────┤
   │ id (PK)      │
   │ username     │
   │ password     │
   └──────────────┘
```

### Relationships

| Relationship | Type | Description |
|---|---|---|
| Patient → Reports | One-to-Many | A patient can have multiple medical reports |
| Doctor → Reports | One-to-Many | A doctor can author multiple reports |
| Hospital → Reports | One-to-Many | A hospital can be associated with multiple reports |
| Report → Files | One-to-Many | A report can have multiple attached files (up to 10) |
| Hospital → Doctors | One-to-Many | A hospital registers multiple doctors via `hospital_doctors` |

---

## 🔌 API Endpoints

### Authentication

| Method | Endpoint | Description |
|---|---|---|
| `PUT` | `/api/patient/signup` | Register a new patient |
| `POST` | `/api/patient/login` | Patient login (returns JWT) |
| `PUT` | `/api/doctor/signup` | Register a new doctor (under a hospital) |
| `POST` | `/api/doctor/login` | Doctor login |
| `PUT` | `/api/hospital/signup` | Register a new hospital |
| `POST` | `/api/hospital/login` | Hospital login |
| `PUT` | `/api/admin/signup` | Register a new admin |
| `POST` | `/api/admin/login` | Admin login |

### Medical Reports (Doctor)

| Method | Endpoint | Auth | Description |
|---|---|---|---|
| `POST` | `/api/doctor/report/` | 🔒 Doctor | Create a new report with file attachments |
| `POST` | `/api/doctor/report/index` | 🔒 Doctor | List reports by patient email |
| `GET` | `/api/doctor/report/:id` | 🔒 Doctor | View a specific report with files |
| `PUT` | `/api/doctor/report/:id` | 🔒 Doctor | Update report details |
| `DELETE` | `/api/doctor/report/:id` | 🔒 Doctor | Delete a report |
| `GET` | `/api/doctor/report/:reportid/:filename` | 🔒 Doctor | Download a file from S3 |

### Analytics (Admin)

| Method | Endpoint | Auth | Description |
|---|---|---|---|
| `GET` | `/api/admin/analytics` | 🔒 Admin | Disease-city cross-tabulation |
| `GET` | `/api/admin/analytics/city/:city` | 🔒 Admin | Disease distribution for a city |
| `GET` | `/api/admin/analytics/disease/:disease` | 🔒 Admin | City distribution for a disease |

---

## 📦 Modules

### 1. User Interface
Responsive React.js dashboard with separate views for each user role — patient, doctor, hospital, and admin. Built with Create React App, styled with custom CSS, and enhanced with Anime.js animations and ScrollReveal transitions.

### 2. Authentication & Authorization
- **JWT-based stateless auth** with 1-hour token expiry
- **bcrypt** password hashing (12 salt rounds)
- **Per-role middleware** guards (`is-auth-patient`, `is-auth-doctor`, `is-auth-hospital`, `is-auth-admin`)
- **Input validation** via `express-validator` (email format, password length, mobile number, duplicate username checks)

### 3. Medical Record Management
- Doctors create medical reports linked to a patient, hospital, and doctor
- Reports include: diseases, medicines, precautions, comments, and city
- Supports **up to 10 file attachments** per report (images: PNG/JPG, documents: PDF)
- Full CRUD operations on reports

### 4. Cloud File Storage
- Files uploaded directly to **AWS S3** via `multer-s3`
- Each file is keyed with a timestamp + original filename for uniqueness
- Files are retrieved on-demand from S3 via the backend API

### 5. Disease Analytics Dashboard
- **City-wise analytics** — View disease prevalence by region
- **Disease-wise analytics** — View geographical spread of a specific disease
- **Cross-tabulation** — Combined disease × city report counts
- Enables public health trend identification and resource allocation insights

---

## 🚀 Setup & Installation

### Prerequisites

- **Node.js** (v12+)
- **MySQL** (v8.0+)
- **AWS Account** with S3 access (for file storage)

### 1. Clone the Repository

```bash
git clone https://github.com/ruturajsawant5/Electronic_Health_Record_Project.git
cd Electronic_Health_Record_Project
```

### 2. Set Up the Database

```bash
# Log in to MySQL and create the database
mysql -u root -p

mysql> CREATE DATABASE EHR;
mysql> CREATE USER 'ehruser'@'localhost' IDENTIFIED BY 'ehrpass';
mysql> GRANT ALL PRIVILEGES ON EHR.* TO 'ehruser'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> EXIT;

# Import the seed data
mysql -u ehruser -p EHR < database/data.sql
```

### 3. Configure Environment Variables

Edit `real-ehr-code-master/vars.env` with your settings:

```env
APP           = 'dev'
IP            = '0.0.0.0'
PORT          = '3000'

DB_DIALECT    = 'mysql'
DB_HOST       = 'localhost'
DB_PORT       = '3306'
DB_NAME       = 'EHR'
DB_USER       = 'ehruser'
DB_PASSWORD   = 'ehrpass'

ACCESS_KEY_ID     = '<your-aws-access-key>'
SECRET_ACCESS_KEY = '<your-aws-secret-key>'
REGION            = '<your-aws-region>'
```

### 4. Install Dependencies & Start the Backend

```bash
cd real-ehr-code-master
npm install
node app.js
# Server starts on http://localhost:3000
```

### 5. Serve the Frontend

The `real-react-app-master/` directory contains a **pre-built production bundle**. Serve it using any static file server:

```bash
# Using npx serve
npx -y serve real-react-app-master

# Or using Python
python3 -m http.server 8080 --directory real-react-app-master
```

---

## 📄 Documentation

The `docs/` directory contains the full project documentation:

| File | Description |
|---|---|
| `Synopsis.pdf` | Project synopsis and scope |
| `Report-Part-1.pdf` | Detailed project report — Part 1 |
| `Report-Part-2.pdf` | Detailed project report — Part 2 |
| `June - Report EHR .docx` | Monthly progress report |
| `CLOUD BASED EHR SYSTEM(Sept).pptx` | Presentation slides |

---

> **Note:** This is a college project built for educational purposes. The AWS credentials and secrets in the codebase are placeholders/expired and should be replaced with your own for a working deployment.
