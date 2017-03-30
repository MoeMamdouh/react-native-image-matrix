
# react-native-image-matrix

## Getting started

`$ npm install react-native-image-matrix --save`

### Mostly automatic installation

`$ react-native link react-native-image-matrix`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-image-matrix` and add `RNImageMatrix.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNImageMatrix.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNImageMatrixPackage;` to the imports at the top of the file
  - Add `new RNImageMatrixPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-image-matrix'
  	project(':react-native-image-matrix').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-image-matrix/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-image-matrix')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNImageMatrix.sln` in `node_modules/react-native-image-matrix/windows/RNImageMatrix.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Com.Reactlibrary.RNImageMatrix;` to the usings at the top of the file
  - Add `new RNImageMatrixPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNImageMatrix from 'react-native-image-matrix';

// TODO: What to do with the module?
RNImageMatrix;
```
  