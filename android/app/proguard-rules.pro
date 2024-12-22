 
 
 -keep class io.flutter.** 
   {*;}
 -dontwarn io.flutter.**
 -dontwarn dart.**
 -keep class okhttp3.**
  {*;}
 -keep class retrofit2.**
           {*;}
 -keepattributes *Annotation*
 -dontwarn okhttp3.**
 -dontwarn retrofit2.**
 -keepattributes Signature,
  *Annotation*