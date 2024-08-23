import 'dart:io';

import 'package:ebaybaymo/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_signin_viewmodel.dart';

class DashboardSigninView extends StackedView<DashboardSigninViewModel> {
  const DashboardSigninView({Key? key}) : super(key: key);

  @override
  DashboardSigninViewModel viewModelBuilder(BuildContext context) =>
      DashboardSigninViewModel();

  @override
  void onViewModelReady(DashboardSigninViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getCurrentUser(); // Fetch user info on view model ready
  }

  @override
  Widget builder(
      BuildContext context, DashboardSigninViewModel viewModel, Widget? child) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldCloseApp = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quit eBaybaymo app',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Are you sure you want to quit?',
                  style: GoogleFonts.poppins(
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  'Yes',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        return shouldCloseApp;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFA52A2A),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Logout your account',
                        style: GoogleFonts.poppins(fontSize: 20.0),
                      ),
                      content: Text(
                        'Are you sure you want to logout?',
                        style: GoogleFonts.poppins(fontSize: 15.0),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            viewModel.logout();
                          },
                          child: Text(
                            'Yes',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person, size: 30),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome, ${viewModel.currentUser?['username'] ?? 'User'}',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              // The user's name can be dynamically displayed here
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                viewModel.navigationservice.navigateTo(Routes.subscription);
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Expanded(
                  flex: 36,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    // Display the processed image result here
                    child: viewModel.recognizedText != null
                        ? Center(
                            child: Text(
                              viewModel.recognizedText!,
                              style: GoogleFonts.poppins(
                                fontSize: 50.0,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              'Processed image result',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: viewModel.isBusy
                      ? null
                      : () {
                          viewModel.transliterateImage();
                        },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        const Color(0xFFA52A2A), // Text and icon color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    elevation: 0, // Optional: Remove shadow if needed
                    shadowColor:
                        Colors.transparent, // Optional: Remove shadow if needed
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFA52A2A)),
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFA52A2A)), // Keep color on press
                    foregroundColor: MaterialStateProperty.all<Color>(Colors
                        .white), // Ensure text and icon color remains white
                  ),
                  child: viewModel.isBusy
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Processing...',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Transliterate',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  flex: 40,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 60.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    // Display the captured image here
                    child: viewModel.pickedImage != null
                        ? Image.file(
                            viewModel.pickedImage!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text(
                              'Captured image',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          child: Container(
            color: const Color(0xFFA52A2A),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: const Offset(-15.0, .0),
                        child: const Icon(Icons.home,
                            size: 30.0, color: Colors.white),
                      ),
                      Transform.translate(
                        offset: const Offset(-15.0, 0.0),
                        child: Text(
                          'Home',
                          style: GoogleFonts.poppins(
                              fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.navigationservice.navigateTo(Routes.about);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: const Offset(15.0, .0),
                        child: const Icon(Icons.info,
                            size: 30.0, color: Colors.white),
                      ),
                      Transform.translate(
                        offset: const Offset(15.0, 0.0),
                        child: Text(
                          'About',
                          style: GoogleFonts.poppins(
                              fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2.0,
                ),
              ),
            ),
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFA52A2A),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2.0,
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 45.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  viewModel.pickImage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
