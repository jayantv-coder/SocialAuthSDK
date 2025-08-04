# SocialAuthSDK

&#x20;  &#x20;

A lightweight SDK for seamless Google and Apple authentication integration in iOS apps.

## 📱 Features

- **Dual Provider Support**
  - Google Sign-In
  - Apple Sign-In (Sign in with Apple)
- **Unified API** - Consistent interface for both providers
- **Modern Swift Implementation** - Async/await compatible
- **Minimal Setup** - Get started in minutes

## 📦 Installation

### Swift Package Manager (Recommended)

1. In Xcode: **File** → **Add Packages...**
2. Enter URL: `https://github.com/jayantv-coder/SocialAuthSDK.git`
3. Select version rules
4. Add to your target

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'SocialAuthSDK', '~> 1.0'
```

Then run:

```bash
pod install
```

## 🔧 Configuration

### 1️⃣ Google Sign-In Setup

#### Step 1: Configure Google Cloud Project

- Visit [Google Cloud Console](https://console.cloud.google.com)
- Create project → APIs & Services → Credentials
- Click **+ CREATE CREDENTIALS** → OAuth client ID
- Select **iOS** and enter your bundle ID (e.g., `com.yourcompany.app`)

#### Step 2: Add to Xcode Project

- Download `GoogleService-Info.plist` from Google Cloud Console
- Drag it into your Xcode project root (ensure "Copy items if needed" is checked)
- Add URL Scheme to Info.plist:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <!-- From GoogleService-Info.plist's REVERSED_CLIENT_ID -->
      <string>com.googleusercontent.apps.12345-yourclientid</string>
    </array>
  </dict>
</array>
```

- Enable **Keychain Sharing** in **Signing & Capabilities**:
  - Add **Keychain Sharing** capability
  - Set **Keychain Groups** to match your bundle ID

### 2️⃣ Apple Sign-In Setup

#### Step 1: Xcode Configuration

- Open your project in Xcode
- Go to **Signing & Capabilities** tab
- Click **+ Capability** → **Sign In with Apple**

#### Step 2: Apple Developer Portal

- Log in to [Apple Developer Account](https://developer.apple.com)
- Navigate to **Certificates, IDs & Profiles**
- Under **Identifiers**, select your **App ID**
- Check **Sign In with Apple** and save changes

#### Step 3: Info.plist Entries (Optional)

```xml
<key>ASAuthorizationAppleIDButtonStyle</key>
<string>white</string> <!-- or "black" -->
```

### 3️⃣ SDK Initialization

Add to `AppDelegate.swift`:

```swift
func application(_ application: UIApplication,
                didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Initialize Google (use client ID from GoogleService-Info.plist)
    SocialAuth.shared.configureGoogle(clientID: "12345-yourclientid.apps.googleusercontent.com")
    
    // Initialize Apple
    SocialAuth.shared.configureApple()
    
    return true
}

// Handle URL callbacks
func application(_ app: UIApplication,
                open url: URL,
                options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    return SocialAuth.shared.handleURL(url)
}
```

## 🚀 Usage

### Google Sign-In

```swift
SocialAuth.shared.signInWithGoogle(presentingViewController: self) { result in
    switch result {
    case .success(let user):
        print("User ID: \(user.userId)")
        print("Email: \(user.email ?? "No email")")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

### Apple Sign-In

```swift
SocialAuth.shared.signInWithApple(presentingViewController: self) { result in
    // Handle result similarly
}
```

### Sign Out

```swift
do {
    try SocialAuth.shared.signOut()
    print("Successfully signed out")
} catch {
    print("Sign out failed: \(error)")
}
```

## 🤋 Troubleshooting

| Issue                           | Solution                                                        |
| ------------------------------- | --------------------------------------------------------------- |
| Google sign-in not working      | Verify `GoogleService-Info.plist` exists and URL scheme matches |
| Apple sign-in not showing       | Check capability is enabled and test on real device             |
| "Provider not configured" error | Call `configureGoogle()`/`configureApple()` before use          |

