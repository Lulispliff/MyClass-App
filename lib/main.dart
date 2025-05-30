import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_class_app/common/localization/locale_delegate.dart';
import 'package:my_class_app/cubit/init_cubit.dart';
import 'package:my_class_app/screens/Inicial/init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitCubit(),
      child: MaterialApp(
        title: 'MyClass App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          LocaleDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        locale: const Locale('pt', 'BR'),
        home: const InitScreen(),
      ),
    );
  }
}
