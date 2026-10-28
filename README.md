# SnackBar Widget Presentation — Quick Notes Demo

A Flutter demonstration app showing how to use the `SnackBar` widget to provide real-time feedback and undo actions in a notes application.

---

## Final App UI

<p align="center">
  <img src="Notes_App_UI.jpg" alt="Notes App UI" width="320"/>
</p>

---

## How to Run the App

1. Ensure you have the Flutter SDK installed on your machine.
2. Navigate to the app directory:
   ```bash
   cd notes_app
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Launch the application:
   ```bash
   flutter run
   ```
   *(Or run directly on web: `flutter run -d chrome`)*

---

## The Three Demonstrated Properties

This demo highlights three key constructor properties of the `SnackBar` widget:

| Property | Default Value | Demo Value | Description & Visual Effect | Developer Rationale ("Why") |
| :--- | :--- | :--- | :--- | :--- |
| **`content`** | *Required (No default)* | `Text(...)` | Defines the widget and message displayed inside the banner. | Informs the user immediately whether their note was saved or if the input was empty. |
| **`duration`** | `4 seconds` | `Duration(seconds: 3)` | Controls how long the banner stays on screen before auto-dismissing. | 4 seconds feels too sluggish for quick confirmations; 3 seconds keeps the app snappy while giving enough time to read. |
| **`action`** | `null` | `SnackBarAction(...)` | Displays an interactive button (`UNDO`) on the right side of the banner. | Gives users an immediate safety net to restore their note without navigating to another screen. |

---

## References & Resources

- [Flutter Official Documentation: Display a snackbar](https://docs.flutter.dev/cookbook/design/snackbars)
- [Flutter YouTube: SnackBar - Widget of the Week](https://youtu.be/zpO6n_oZWw0?si=3U1k9ooNBdkp63ic)