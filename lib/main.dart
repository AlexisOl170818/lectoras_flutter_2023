import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectoras_2023/views/enter_licence.dart';
import 'package:lectoras_2023/views/main_screen.dart';
import 'package:lectoras_2023/views/qr_scan.dart';
import 'package:lectoras_2023/views/select_event.dart';

void main() {
  runApp(
    const App(),
  );
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color.fromARGB(255, 13, 158, 216),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const SelectEvent(),
      builder: EasyLoading.init(),
      initialRoute: 'select_event',
      routes: {
        'select_event': (_) => const SelectEvent(),
        'enter_licence': (_) => const EnterLicence(),
        'qr_scan': (_) => const QRViewExample(),
        'main_screen': (_) => const MainScreen(),
      },
    );
  }
}
