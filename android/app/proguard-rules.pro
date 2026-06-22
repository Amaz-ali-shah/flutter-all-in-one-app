# Mobile Scanner / ML Kit
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.mlkit.**
-dontwarn com.google.android.gms.**

# Zxing (barcode library)
-keep class com.google.zxing.** { *; }
-dontwarn com.google.zxing.**

# Keep camera2 classes
-keep class androidx.camera.** { *; }
-dontwarn androidx.camera.**

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }
-dontwarn com.baseflow.permissionhandler.**