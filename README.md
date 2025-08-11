# Video Call App (GetStream) — Task Submission

A simple Flutter app for group video calls using the Stream Video SDK.  
Prepared as a solution for a technical task submitted to **Guitara Group**.

---

## Requirements
- Flutter (stable)
- Node.js (v14+ or compatible)
- GetStream account (API key + API secret)

---

## Quick Setup

### 1️⃣ Start the Token Provider Server
1. Open:
```
lib/core/server/server.js
```
2. Set your API key & secret:
```javascript
const apiKey = '<YOUR_STREAM_API_KEY>';
const apiSecret = '<YOUR_STREAM_API_SECRET>';
```
3. Run:
```bash
cd lib/core/server
npm install
node server.js
```
4. Make sure the server listens to all IPs:
```javascript
app.listen(3000, '0.0.0.0');
```
5. Use the correct server URL in Flutter:
- Android emulator → `http://10.0.2.2:3000`
- iOS simulator → `http://127.0.0.1:3000`
- Physical device → `http://<YOUR_COMPUTER_IP>:3000`

---

### 2️⃣ Run the Flutter App
1. Open:
```
lib/core/service/vc_service.dart
```
2. Set your keys:
```dart
static const String _apiKey = '<YOUR_STREAM_API_KEY>';
static const String _serverUrl = 'http://10.0.2.2:3000'; // or your IP
```
3. Install packages:
```bash
flutter pub get
```
4. Start:
```bash
flutter run
```

---

## How It Works
- **Contacts Screen** → lists favorites & recent calls with a search text field.
- **Video Call Screen** → uses `StreamCallContainer` to display the call.
- **States** → Loading spinner, error messages, connected call view.
- **Server** → generates user tokens for joining rooms.

---




