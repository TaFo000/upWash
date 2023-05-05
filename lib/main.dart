
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:up_wash/pages/onboardingScreen.dart';
import 'package:up_wash/provider.dart';
import 'package:up_wash/upWashColors.dart';
import 'dart:io' show Platform;

Future<void> main() async {


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'GT Walsheim Pro'),

      theme: context.watch<AppProvider>().themeIsDark
          ? ThemeData.light()
              .copyWith(extensions: <ThemeExtension<UpWashColors>>[
              UpWashColors(
                primaryOrange: Color(0xffFF6600),
                textColor: Color(0xff000000),
                iconButtonColor: Color(0xffFFFFFF),
                homePageDraggableSheet: Color(0xffFFFFFF),
                backgroundColor: Color(0xffFFFFFF),
                shadowColor: Color(0xffEDEDED),
                homeBackgroundColor: Color(0xffFF6600)
              )
            ])
          : ThemeData.dark()
              .copyWith(extensions: <ThemeExtension<UpWashColors>>[
              UpWashColors(
                primaryOrange: Color(0xffFF6600).withOpacity(0.8),
                textColor: Color(0xffFFFFFF),
                iconButtonColor: Color(0xffFF6600).withOpacity(0.2),
                homePageDraggableSheet: Color(0xffFFFFFF).withOpacity(0.2),
                backgroundColor: Color(0xff292D32),
                shadowColor: Color(0xffEDEDED),
                homeBackgroundColor: Color(0xff292D32)
              )
            ]),
      darkTheme:
      context.watch<AppProvider>().themeIsDark
          ? ThemeData.light()
          .copyWith(extensions: <ThemeExtension<UpWashColors>>[
        UpWashColors(
          primaryOrange: Color(0xffFF6600),
          textColor: Color(0xff000000),
          iconButtonColor: Color(0xffFFFFFF),
          homePageDraggableSheet: Color(0xffFFFFFF),
          backgroundColor: Color(0xffFFFFFF),
          shadowColor: Color(0xffEDEDED),
            homeBackgroundColor: Color(0xffFF6600)
        )
      ])
          : ThemeData.dark()
          .copyWith(extensions: <ThemeExtension<UpWashColors>>[
        UpWashColors(
          primaryOrange: Color(0xffFF6600).withOpacity(0.8),
          textColor: Color(0xffFFFFFF),
          iconButtonColor: Color(0xffFF6600).withOpacity(0.2),
          homePageDraggableSheet: Color(0xffFFFFFF).withOpacity(0.2),
          backgroundColor: Color(0xff292D32),
          shadowColor: Color(0xffEDEDED),
            homeBackgroundColor: Color(0xff292D32)
        )
      ]),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/main': (context) => MyHomePage()
      },

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'EN'), // English, no country code
        Locale('ru', 'RU'), // Spanish, no country code
      ],
      home: OnboardingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context).helloWorld),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/onboarding'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
