import 'package:carting/views/cart/cart_v.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

/*
  * Routes and Services for the app are registered here.
  
  * Generate dependency files by running the following command in the terminal   
  * * flutter pub run build_runner build --delete-conflicting-outputs
  
*/

@StackedApp(
  dependencies: [
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
  ],
  routes: <StackedRoute<dynamic>>[
    StackedRoute<dynamic>(path: CartView.routeName, page: CartView),
  ],
)
class App {}
