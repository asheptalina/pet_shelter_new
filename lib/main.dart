import 'package:flutter/material.dart';
import 'package:pet_shelter_new/navigation/routes.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Pet Shelter',
        theme: ThemeData(primarySwatch: Colors.blue),
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
            routesBuilder: ((BuildContext delegateContext) {
              return Routes.authorizedRouteMap;
            })
        )
    );
  }
}