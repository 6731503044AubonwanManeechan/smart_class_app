# Smart Class App - Product Requirement Document

## 1. Overview

Smart Class App is a Flutter-based mobile/web application designed to help students check in to class, record learning reflections, and track participation using QR code and GPS verification.

## 2. Objectives

* Allow students to check in to class using QR code scanning
* Record GPS location to verify attendance
* Allow students to reflect on previous and expected topics
* Store check-in data for review at the end of class

## 3. Target Users

* University students
* Instructors tracking attendance and engagement

## 4. Core Features

### 1. Home Screen

* Entry point of the application
* Navigation to Check-in and Finish Class screens

### 2. Check-in Screen

* Scan QR Code
* Capture GPS location
* Input:

  * Previous Topic
  * Expected Topic
  * Mood (1–5)

### 3. Finish Class Screen

* Display submitted check-in data
* Allow class reflection

## 5. Technical Stack

* Flutter
* Dart
* Geolocator (GPS)
* Mobile Scanner (QR Code)

## 6. MVP Scope

* QR Code scanning
* GPS location retrieval
* Form submission
* Data display
