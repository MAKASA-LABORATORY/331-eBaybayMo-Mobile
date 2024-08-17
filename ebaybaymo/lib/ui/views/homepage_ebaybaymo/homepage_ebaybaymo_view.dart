import 'dart:io';

import 'package:ebaybaymo/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'homepage_ebaybaymo_viewmodel.dart';

class HomepageEbaybaymoView extends StackedView<HomepageEbaybaymoViewModel> {
  const HomepageEbaybaymoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomepageEbaybaymoViewModel viewModel,
    Widget? child,
  ) {
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
                  'Are you sure you want to quit ?',
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(
              height: 100.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0)
                    .copyWith(left: 24.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/resources/images/profile.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          'Max Angelo Perin',
                          style: GoogleFonts.poppins(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        viewModel.navigationservice
                            .navigateTo(Routes.subscription);
                      },
                      child: Text(
                        'Click Me',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 220.0,
              width: double.infinity,
              margin: const EdgeInsets.all(20.0),
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
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA52A2A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
              ),
              child: Row(
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
            Container(
              height: 220.0,
              width: double.infinity,
              margin: const EdgeInsets.all(20.0),
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
              child: viewModel.pickedImage != null
                  ? Image.file(
                      viewModel.pickedImage!,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No image selected')),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80.0,
          child: ClipRRect(
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(30.0),
            //   topRight: Radius.circular(30.0),
            // ),
            child: BottomAppBar(
              color: const Color(0xFFA52A2A),
              shape: const CircularNotchedRectangle(),
              notchMargin: 4.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.home, color: Colors.white),
                        iconSize: 30.0,
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Transform.translate(
                          offset: const Offset(0, -8),
                          child: Text(
                            'Home',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 60.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info, color: Colors.white),
                        iconSize: 30.0,
                        onPressed: () {
                          viewModel.navigationservice.navigateTo(Routes.about);
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.navigationservice.navigateTo(Routes.about);
                        },
                        child: Transform.translate(
                          offset: const Offset(0, -8),
                          child: Text(
                            'About',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 105.0,
          height: 105.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFA52A2A),
            border: Border.all(
                color: const Color.fromARGB(255, 221, 73, 73), width: 3.0),
          ),
          child: Center(
            child: IconButton(
              iconSize: 60.0,
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () async {
                await viewModel.pickImage();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomepageEbaybaymoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomepageEbaybaymoViewModel();
}
