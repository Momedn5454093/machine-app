import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campaigns & Tracking'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Active Campaigns', style: TextStyles.font24BlackBold),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'New retention campaign created successfully!',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New Campaign'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCampaignCard(
              'Discount Offer Q4',
              'Target: High Risk Customers (1,245)',
              'Active',
              AppColors.green,
              '74% Opened',
            ),
            _buildCampaignCard(
              'VIP Cashback Reward',
              'Target: Medium Risk Customers (850)',
              'Completed',
              AppColors.gray,
              '91% Redeemed',
            ),
            _buildCampaignCard(
              'Re-engagement Email Blast',
              'Target: Inactive Users (3,100)',
              'Paused',
              Colors.orange,
              '45% Delivery',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignCard(
    String title,
    String subtitle,
    String status,
    Color statusColor,
    String metric,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(subtitle, style: TextStyles.font13GrayRegular),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Performance Metric: $metric',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.gray,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
