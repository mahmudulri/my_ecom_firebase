import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Expanded(
              //   child: SfPdfViewer.network(
              //     'https://firebasestorage.googleapis.com/v0/b/forex-update-699e7.appspot.com/o/privacy-policy%2Fprivacy-policy.pdf?alt=media&token=c874a612-4ba6-4ee5-b405-5979113801e9',
              //     onDocumentLoaded: (PdfDocumentLoadedDetails details) {
              //       _loaded.value = true;
              //     },
              //   ),
              // ),
              // Obx(
              //   () => _loaded == true
              //       ? VioletButton(
              //           "Agree",
              //           () => Get.toNamed(bottomNavController),
              //         )
              //       : Text('Still Loading'),
              // ),
              VioletButton("agree", () => Get.toNamed(mainHomeScreen)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
