import 'package:flutter/material.dart';
import 'package:flutter_minus_odin_plus_dva/cifra.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Countik(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countik = context.watch<Countik>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OGC',
          style:
              TextStyle(color: Color(0xFFDC143C), fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              countik.cifra.toString(),
              style: const TextStyle(fontSize: 50, color: Color(0xFFDC143C)),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffd4af37),
                  ),
                  onPressed: () {
                    if (countik.cifra > 0) {
                      countik.cifra--;
                    }
                    countik.goPro();
                  },
                  child: const Text(
                    '-1',
                    style: TextStyle(
                      color: Color(0xFFDC143C),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffd4af37),
                  ),
                  onPressed: () {
                    countik.cifra += 2;
                    countik.goPro();
                  },
                  child: const Text(
                    '+2',
                    style: TextStyle(
                      color: Color(0xFFDC143C),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
