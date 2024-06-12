import 'package:real_estate_app/screens/home.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../screens/bottom_nav_pages/home_screen.dart';

@StackedApp(routes: [
  MaterialRoute(page: Home, initial: true),
  MaterialRoute(page: HomeScreen,),
], dependencies: [
  LazySingleton(classType: NavigationService),
])
class App {}
