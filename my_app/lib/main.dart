//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/screen/home.dart';
import 'package:my_app/textTranslations.dart';
//import 'package:flutter_openvpn/flutter_openvpn.dart';

void main() {
  //HttpOverrides.global = new MyHttpOverrides();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   // systemNavigationBarColor: HexColor('#05B06C'),
    //   statusBarColor: Colors.black,
    // ));
    return GetMaterialApp(
      translations: TextTranslations(),
      locale: Get.deviceLocale,
      // supportedLocales: [
      //   Locale('en', ''),
      //   Locale('th', ''),
      // ],
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocales in supportedLocales) {
      //     if (supportedLocales.languageCode == locale.languageCode &&
      //         supportedLocales.countryCode == locale.countryCode) {
      //       return supportedLocales;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      home: Home(),
    );
  }

  // static Future<void> initPlatformState() async {
  //   await FlutterOpenvpn.lunchVpn(
  //     "SAMPLE_OVPN_FILE",
  //     (isProfileLoaded) {
  //       print('isProfileLoaded : $isProfileLoaded');
  //     },
  //     (vpnActivated) {
  //       print('vpnActivated : $vpnActivated');
  //     },
  //     user: 'user',
  //     pass: 'pass',
  //     onConnectionStatusChanged:
  //         (duration, lastPacketRecieve, byteIn, byteOut) => print(byteIn),
  //     expireAt: DateTime.now().add(
  //       Duration(
  //         seconds: 180,
  //       ),
  //     ),
  //   );
  // }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) = true) as bool Function(X509Certificate cert, String host, int port);
//   }
// }
