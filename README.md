# Improving Usability of Data Charts in Multimodal Documents for Low Vision Users

## Recommended 
----
### IDE Setup

**Recommended IDE**: [Visual Studio Code](https://code.visualstudio.com/)

#### Essential Plugins for Visual Studio Code:
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments): Enhances comment visibility and organization.
- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens): Immediate inline display of code errors.
- [Pubspec Assist](https://marketplace.visualstudio.com/items?itemName=jeroen-meijer.pubspec-assist): Easily add dependencies to your project.
- [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight): Marks CSS/web colors in your code.

#### Configuration Tips:
- Set the Dart Line Length as shown below for optimal readability:
  ![Dart: Line Length Configuration](https://i.imgur.com/DrT5MAe.png)

- Dart Line Length Configuration
![Dart: Line Length Configuration](https://i.imgur.com/DrT5MAe.png)

---

## Linting
All linting options need to be added to `analysis_options.yaml`. This is present in the root directory of the project 

```
floatingbubble/
|- analysis_options.yaml
```

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/anonymous281107/ChartSync2024.git
```

**Step 2:**

Go to project root and execute the following commands in console to get the required dependencies: 

``` 
flutter pub get
flutter pub upgrade
```

### Building a release APK

Go to project root and execute the following commands in console to clean build the release APK: 

``` 
flutter clean
flutter build appbundle --target-platform android-arm,android-arm64
```


### Code Commit Guidelines

- Ensure all code is well-commented with clear, meaningful variable names.
- Avoid unnecessary overheads and redundant code.
- Use the Dart formatter provided by the IDE for consistent code formatting.
- Import order: Flutter core libraries, external libraries, then local files.

### Branch Management

- **Creating a New Branch**: Create branches for new features with descriptive names, e.g., `floatingbubble-customtheme`.
- **When to Merge a Branch**:
![When to merge a branch](https://i.imgur.com/t4qSgnA.png)

### Key Libraries & Tools

- [In-App Webview](https://github.com/pichillilorenzo/flutter_inappwebview)
- [Multi-select Flutter](https://pub.dev/packages/multi_select_flutter)
- [HTTP](https://pub.dev/packages/http)
- [Crypto](https://pub.dev/packages/crypto)
- [FL Chart](https://pub.dev/packages/fl_chart)
- [Firebase Core](https://pub.dev/packages/firebase_core)
- [Firebase Analytics](https://pub.dev/packages/firebase_analytics)
- [Dropdown Button2](https://pub.dev/packages/dropdown_button2)
- [Provider](https://github.com/rrousselGit/provider)
- [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts)

