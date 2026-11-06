import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers Management'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search customer by name or ID...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final bool isHighRisk = index % 3 == 0;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isHighRisk
                            ? AppColors.red.withValues(alpha: 0.1)
                            : AppColors.green.withValues(alpha: 0.1),
                        child: Icon(
                          isHighRisk ? Icons.warning : Icons.person,
                          color: isHighRisk ? AppColors.red : AppColors.green,
                        ),
                      ),
                      title: Text(
                        'Customer #${1000 + index}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Tenure: ${index + 2} yrs | Balance: \$${(index + 1) * 1250}',
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isHighRisk
                              ? AppColors.red.withValues(alpha: 0.1)
                              : AppColors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isHighRisk ? 'High Risk' : 'Low Risk',
                          style: TextStyle(
                            color: isHighRisk ? AppColors.red : AppColors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.customerDetailScreen,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
