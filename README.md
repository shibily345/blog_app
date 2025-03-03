# **Blogit - Flutter Internship Assignment**  

## **Project Overview**  
Blogit is a Flutter-based application designed to showcase a list of blog posts fetched from **Firebase Firestore**, with **deep linking** support for seamless navigation. This project follows the given assessment requirements while maintaining high code quality and structure.  

---

## **Features Implemented**  
✅ Fetch blog posts from **Firebase Firestore**  
✅ Display blog posts in a **ListView.builder**  
✅ **Deep Linking** to open a specific blog post directly  
✅ Blog post details screen with full content display  
✅ **MVVM Architecture** for clean code organization  
✅ **Provider** for state management  
✅ **Freezed Annotation** for immutable models  
✅ **Smooth UI & Animations** for enhanced user experience  
✅ **Optimized Performance** 

---


# Demo Video  
[🎥 Watch Demo Video](demo/demo.mov)
at demo folder

---

## **Tech Stack Used**  
- **Flutter** (Latest Stable Version)  
- **Dart** (Programming Language)  
- **Firebase Firestore** (Database)  
- **Provider (State Management)**  
- **GoRouter** (Deep Linking & Navigation)  
- **Freezed (Code Generation & Immutability)**  
- **ScreenUtil (Responsive UI)**  

---

## **Installation & Setup**  

### **Prerequisites**  
- Flutter SDK installed ([Download Flutter](https://flutter.dev/docs/get-started/install))  
- Dart installed  
- Android Studio or VS Code  
- A connected Android/iOS device or emulator  
- Firebase Project Set Up  

### **Steps to Run the Project**  

1. **Clone the Repository**  
   ```sh
   
   ```  
2. **Install Dependencies**  
   ```sh
   flutter pub get  
   ```  
3. **Configure Firebase**  
   - Create a Firebase project.  
   - Add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS).  
   - Enable Firestore in the Firebase console.  

4. **Run the App**  
   ```sh
   flutter run  
   ```  

---

## ** Deep Linking Setup**  
  

Test deep linking:  

```sh
# Android  
adb shell am start -W -a android.intent.action.VIEW -d Blogit://blog/2   

# iOS  
xcrun simctl openurl booted Blogit://blog/2 
```  

---

## **Submission Details**  
- **GitHub Repository:** [Blogit Repo](https://github.com/shibily345/blog_app)  
- **Demo Video:** Available in the `demo/` folder (`demo/demo.mov`)  
- **Deadline:** 25 feb 2025
  

---

## **Contact**  
For any clarifications, reach out via **Email** or **Internshala Messages**.  

---  

_This project was developed as part of the Zarity Health Flutter Internship Assignment._ 🚀  
