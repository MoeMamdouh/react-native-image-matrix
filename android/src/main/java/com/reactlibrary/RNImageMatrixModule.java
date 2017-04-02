
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
////
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.NativeModule;
import java.util.Map;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.Arguments;
///
public class RNImageMatrixModule extends ReactContextBaseJavaModule {
  private final ReactApplicationContext reactContext;

  public RNImageMatrixModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

@ReactMethod
  public void getImageUrl(String path, int rows, int columns, Callback callback) {
    WritableArray srcs = Arguments.createArray();
    srcs.pushString("fileMap");
    srcs.pushString("fileMap1");
    callback.invoke(srcs);
  }
  
  @Override
  public String getName() {
    return "RNImageMatrix";
  }
}
