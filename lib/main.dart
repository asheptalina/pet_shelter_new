import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter_new/navigation/routes.dart';
import 'package:pet_shelter_new/services/dio_network_service.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<ImagePicker>(ImagePicker());
  GetIt.instance.registerSingleton<NetworkService>(DioNetworkService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Pet Shelter',
        theme: ThemeData(primarySwatch: Colors.blue),
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
            routesBuilder: ((BuildContext delegateContext) {
              return Routes.unauthorizedRouteMap;
            })
        )
    );
  }
}