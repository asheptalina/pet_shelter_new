import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pet_shelter_new/navigation/routes.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/repositories/local_storage/shared_preferences_storage.dart';
import 'package:pet_shelter_new/services/dio_network_service.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/app_state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesStorage localStorage = SharedPreferencesStorage();
  await localStorage.init();
  GetIt.instance.registerSingleton<LocalStorage>(localStorage);
  GetIt.instance.registerSingleton<ImagePicker>(ImagePicker());
  GetIt.instance.registerSingleton<NetworkService>(DioNetworkService(localStorage: localStorage));

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
        create: (_) => AppState(localStorage: GetIt.instance.get<LocalStorage>()),
        child: Consumer<AppState>(builder:(_, value, child) {
          return OverlaySupport.global(
              child: MaterialApp.router(
                  title: 'Pet Shelter',
                  theme: ThemeData(primarySwatch: Colors.blue),
                  routeInformationParser: const RoutemasterParser(),
                  routerDelegate: RoutemasterDelegate(
                      routesBuilder: ((BuildContext delegateContext) {
                        return Provider.of<AppState>(delegateContext).isAuthorized
                            ? Routes.authorizedRouteMap
                            : Routes.unauthorizedRouteMap;
                      })
                  )
              )
          );
        })
    );
  }
}