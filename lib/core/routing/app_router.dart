import 'package:flutter/material.dart';

import '../../features/campaigns/ui/campaigns_screen.dart';
import '../../features/customer_details/ui/customer_detail_screen.dart';
import '../../features/customers/ui/customers_screen.dart';
import '../../features/dashboard/ui/dashboard_screen.dart';
import '../../features/dataset_import/ui/dataset_import_screen.dart';
import '../../features/login/ui/login_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.customersScreen:
        return MaterialPageRoute(builder: (_) => const CustomersScreen());
      case Routes.customerDetailScreen:
        return MaterialPageRoute(builder: (_) => const CustomerDetailScreen());
      case Routes.datasetImportScreen:
        return MaterialPageRoute(builder: (_) => const DatasetImportScreen());
      case Routes.campaignsScreen:
        return MaterialPageRoute(builder: (_) => const CampaignsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
