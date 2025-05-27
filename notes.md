## How to Connect Flutter App to Your Local Backend (Switching from Dummy Data)

This guide will help you switch the Flutter app from using built-in dummy data to using your actual local backend.

---
**Step 1: Make Sure Your Backend Server is Running**
---

1.  Open your terminal or command prompt.
2.  Go to your backend project folder (e.g., `smart-clinic-back-main`).
3.  Start the backend server using the command (usually from your `package.json`):
    ```bash
    npm run dev
    ```
4.  Look for a message like "🚀 Server is running on port 5000". This means the backend is ready. The default port is 5000.

---
**Step 2: Find Your Backend's IP Address and Port**
---

* **Port:** Usually **5000**.
* **IP Address:**
    * **Flutter app on Android Emulator (backend on same PC/Mac):**
        Use IP: `10.0.2.2`
        Full address prefix: `http://10.0.2.2:5000`
    * **Flutter app on iOS Simulator (backend on same Mac):**
        Use IP: `localhost` (or `127.0.0.1`)
        Full address prefix: `http://localhost:5000`
    * **Flutter app on a Physical Phone/Tablet (or different PC/Mac on same WiFi):**
        1.  Find the local IP of the computer running the backend (e.g., `192.168.1.X`).
            * Windows: `ipconfig` in Command Prompt.
            * macOS/Linux: `ifconfig` or `ip addr` in Terminal.
        2.  Ensure your computer's firewall allows connections to port 5000.
        3.  Full address prefix: `http://<YOUR_COMPUTER_IP>:5000`

---
**Step 3: Update the Flutter App's Base URL**
---

1.  In your Flutter project, open the file:
    `lib/src/core/services/dio_provider.dart`
2.  Find the line:
    ```dart
    const String _baseUrl = '...'; // Current URL
    ```
3.  Change this URL to your backend address from Step 2, **AND add `/api` at the end.**
    * Example for Android Emulator:
        ```dart
        const String _baseUrl = 'http://10.0.2.2:5000/api';
        ```
    * Example for Physical Device (replace with your actual IP):
        ```dart
        const String _baseUrl = 'http://192.168.1.103:5000/api';
        ```
4.  Save the `dio_provider.dart` file.

---
**Step 4: Turn Off Dummy Data in the Flutter App (Central Toggle)**
---

1.  In your Flutter project, open the central configuration file:
    `lib/src/core/config/app_config.dart`
2.  Find the line:
    ```dart
    const bool shouldUseMockData = true; 
    ```
3.  To connect to your **REAL local backend**, change `true` to `false`:
    ```dart
    const bool shouldUseMockData = false; 
    ```
4.  To switch back to **dummy data** for testing without the backend, change it back to `true`.
5.  Save the `app_config.dart` file.
    (This single change now controls all repositories: Auth, Appointments, and Doctors).

---
**Step 5: Restart and Test Your Flutter App**
---

1.  Save all changes in your Flutter project.
2.  Stop the Flutter app if it's running.
3.  Restart the app from your IDE or terminal (a full "flutter run" is best):
    ```bash
    flutter run
    ```
4.  Test all features: Login, Signup, View Doctors, Book Appointment, View Appointments.
5.  Check your IDE's Debug Console and the backend server terminal for any error messages.

---
**Step 6 (Optional - After Demo): Permanently Remove Dummy Code**
---

If you no longer need the dummy data setup:

1.  In `lib/src/core/config/app_config.dart`, you can delete the `shouldUseMockData` line or set it permanently to `false`.
2.  In each of the repository implementation files (`auth_repository.dart`, `appointment_repository.dart`, `doctor_repository.dart`):
    * Delete the import for `app_config.dart`.
    * Delete the `if (shouldUseMockData) { ... }` block from each method, leaving only the real API call logic.
3.  Delete the dummy data file: `lib/src/core/dev/dummy_data.dart`.
4.  Delete any instance variables used only for dummy data within the repository classes (e.g., `_dummyRAMUser`, `_instanceInMemoryDummyAppointments`, `_instanceSessionDummyDoctors`).

Good luck with the demo!