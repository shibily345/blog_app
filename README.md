# **Blogit - Flutter Internship Assessment**  

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
✅ **Optimized Performance** with pagination support  

---

## 🎥 Demo Video
[![Watch the Demo](https://img.icons8.com/fluency/48/youtube-play.png)]([https://drive.google.com/file/d/YOUR_VIDEO_ID/view](https://drive.google.com/drive/folders/1Sowjiaj8tB84kmdS579wje-B8IWwh7-o?usp=sharing))

---

## **Tech Stack Used**  
- **Flutter** (Latest Stable Version)  
- **Dart** (Programming Language)  
- **Firebase Firestore** (Database)  
- **Provider (State Management)**  
- **GoRouter** (Deep Linking & Navigation)  
- **Freezed (Code Generation & Immutability)**  
- **ScreenUtil (Responsive UI)**  
- **HTTP Package (Networking & API Requests)**  

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
   git clone https://github.com/your-username/blogit.git  
   cd blogit  
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

1. Open Firebase Console → Go to **Dynamic Links**.  
2. Configure your app’s **Dynamic Link domain**.  
3. Enable Firebase **Dynamic Links API**.  
4. Implement **GoRouter** in the app to handle deep links.  

Test deep linking:  

```sh
# Android  
adb shell am start -W -a android.intent.action.VIEW -d "https://blogit.com/post?id=123" your.package.name  

# iOS  
xcrun simctl openurl booted "https://blogit.com/post?id=123"  
```  

---

## **Submission Details**  
- **GitHub Repository:** [Blogit Repo](https://github.com/your-username/blogit)  
- **Demo Video:** Available in the `demo/` folder (`demo/demo.mov`)  
- **Deadline:** [Insert Deadline Here]  

---

## **Contact**  
For any clarifications, reach out via **Email** or **Internshala Messages**.  

---  

_This project was developed as part of the Blogit Flutter Internship Assessment._ 🚀  
