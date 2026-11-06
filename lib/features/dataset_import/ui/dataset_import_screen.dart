import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';

class DatasetImportScreen extends StatefulWidget {
  const DatasetImportScreen({super.key});

  @override
  State<DatasetImportScreen> createState() => _DatasetImportScreenState();
}

class _DatasetImportScreenState extends State<DatasetImportScreen> {
  String? fileName;
  bool isUploading = false;
  bool uploadSuccess = false;

  Future<void> _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        isUploading = true;
      });

      // Simulate API upload /api/imports/customers/
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isUploading = false;
        uploadSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dataset Import (CSV)'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_upload_outlined,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 20),
            Text('Upload Customer Dataset', style: TextStyles.font24BlackBold),
            const SizedBox(height: 8),
            Text(
              'Upload CSV or Excel file containing customer features to run batch Churn prediction.',
              textAlign: TextAlign.center,
              style: TextStyles.font13GrayRegular,
            ),
            const SizedBox(height: 32),
            if (fileName != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.lighterGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.insert_drive_file,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        fileName!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (uploadSuccess)
                      const Icon(Icons.check_circle, color: AppColors.green),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            isUploading
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _pickAndUploadFile,
                    icon: const Icon(Icons.folder_open),
                    label: const Text(
                      'Select CSV File',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
            if (uploadSuccess) ...[
              const SizedBox(height: 20),
              const Text(
                'Dataset imported successfully! 1,200 records processed.',
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
