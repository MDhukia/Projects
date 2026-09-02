# 🌤️ Weather App

A full-stack weather web application built with **Python, Flask, SQLite, HTML, CSS, and REST APIs**.

This application allows users to:

- Search for weather using a city, ZIP/postal code, or other location input
- Select a start date and end date
- Retrieve current weather information
- View daily minimum and maximum temperatures
- Calculate average, minimum, and maximum temperatures
- Save weather searches to a SQLite database
- View weather search history
- View individual weather records
- Edit/update saved records
- Delete saved records
- Export weather history as CSV
- Export weather history as PDF
- Display weather information using a styled web interface

The project demonstrates **REST API integration, database persistence, CRUD operations, form validation, data processing, and Flask web application development**.

---

## 📌 Project Overview

The Weather App connects a Flask web application with the **Open-Meteo Geocoding API** and **Open-Meteo Weather API**.

The application follows this workflow:

```text
User enters location
        ↓
Location Validation
        ↓
Open-Meteo Geocoding API
        ↓
Latitude + Longitude
        ↓
Open-Meteo Weather API
        ↓
Current + Daily Weather
        ↓
Display Weather Results
        ↓
Save Search to SQLite Database
        ↓
Weather History
        ↓
View / Edit / Delete
        ↓
Export CSV / PDF
```


## ⚙️ Installation
1. Clone the Repository
git clone https://github.com/MDhukia/Projects.git
2. Navigate to the Weather App
cd Projects/"Weather App"
3. Create a Virtual Environment
python -m venv venv
4. Activate the Virtual Environment

For Windows PowerShell:

venv\Scripts\Activate.ps1

If PowerShell blocks activation, run:

Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

Then activate the environment:

venv\Scripts\Activate.ps1
5. Install Dependencies
pip install -r requirements.txt


## ▶️ Run the Application

Start the Flask application using:

python app.py

The application will start locally.

Open the following URL in your browser:

http://127.0.0.1:5000

You can then:

Enter a location.
Select a start date.
Select an end date.
Click the weather/search button.
View the weather results.
Save and manage weather records.

## 🎥 Project Demo

▶️ **[Watch the Weather App Demo](https://youtu.be/M4z4SH8_Jxk)**

 Developed by: Monika Dhukia
 Project: PM Accelerator – Tech Assessment 
 Application Type: Full-Stack Backend / CRUD Weather Application

