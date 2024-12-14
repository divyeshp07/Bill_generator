
import 'package:bill_manager_jmd_task/main.dart';
import 'package:bill_manager_jmd_task/view/pages/create_bill_page.dart';
import 'package:bill_manager_jmd_task/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  navigatorKey: MyApp.navigatorKey,
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) {
        return const HomePage();
      },
     // },
    ),
    GoRoute(
      path: CreateBillPage.routePath,
      builder: (context, state) {
        return const CreateBillPage();
      },
      
    ),
  ],
);