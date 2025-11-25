# 📘 Mobile Piscine – Flutter Applications

This repository contains **three Flutter applications** developed during the 42 Piscine Mobile program.  
Each app demonstrates different Flutter concepts including UI design, API integration, charts, authentication, and Firebase database operations.

---

# 📱 1. Calculator App

### **Overview**
A simple and clean calculator built with Flutter.  
Supports all basic arithmetic operations with a responsive UI.

### **Features**
- Real-time calculation updates  
- Addition, subtraction, multiplication, division  
- Error handling (invalid expressions, divide-by-zero)  
- Minimalistic and mobile-friendly design

### **Screenshots**
<table>
  <tr>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Calculator_1.png">
    </td>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Calculator_2.png">
    </td>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Calculator_3.png">
    </td>
  </tr>
</table>
---

# ☀️ 2. Weather App

### **Overview**
A full weather application using the **Open-Meteo API** with real-time forecasts.  
Includes charts, temperature curves, icons, backgrounds, and location search.

### **Features**
- Live weather API data  
- Today’s hourly chart (FL Chart)  
- Weekly min/max temperature chart  
- Search for a city  
- Beautiful dynamic backgrounds  
- Fully responsive UI

### **Screenshots**
<table>
  <tr>
    <td>
        <img width="80%" src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Weather_1.png">
    </td>
    <td>
        <img width="80%" src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Weather_1.1.png">
    </td>
  </tr>
  <tr>
    <td>
        <img width="80%" src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Weather_2.png">
    </td>
    <td>
        <img width="80%" src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Weather_3.png">
    </td>
  </tr>
</table>

---

# 📓 3. Diary App (Firebase)

### **Overview**
A complete diary application using **Firebase Authentication** and **Firestore Database**.  
Includes login, entry creation, deletion, agenda tracking, and real-time updates.

---

## 🔐 Authentication
- Login with **Google**
- Login with **GitHub**
- Auto-redirect to profile if already logged in

---

## 📄 Profile Page Features
- Display user’s name & email  
- Logout button  
- Total number of entries  
- List of last 2 entries (title, date, feeling)  
- Open entry to view details  
- Delete an entry  
- Feelings usage percentage chart  
- Button to add new entry  
- Real-time Firestore updates  

---

## 📅 Agenda Page Features
- Calendar view with current date highlighted  
- Select any date  
- View entries from the selected date  
- Tap to view entry details  
- Delete entry with instant update  

---

### **Screenshots**
<table>
  <tr>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Diary_1.png">
    </td>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Diary_3.png">
    </td>
    <td>
        <img src="https://raw.githubusercontent.com/FredericBicandi/42-MobilePiscine/refs/heads/master/.ss/Diary_3.png">
    </td>
  </tr>
</table>
---

# 📦 Project Structure
/calculator_app
/weather_app
/advanced_diary_app


Each folder contains a fully independent Flutter project.

---

# 🚀 Running the Apps

```bash
flutter pub get
flutter run
