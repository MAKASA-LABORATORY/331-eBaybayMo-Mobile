import 'dart:io'; // Required for exit(0)

import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  final GoogleSignInAccount user;

  const DashboardView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
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
                                  Navigator.of(context)
                                      .pop(); 
                                },
                                child: Text(
                                  'No',
                                  style:
                                      GoogleFonts.poppins(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  viewModel.logout();
                                },
                                child: Text(
                                  'Yes',
                                  style:
                                      GoogleFonts.poppins(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: user.photoUrl != null
                          ? ClipOval(
                              child: Image.network(
                                user.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(Icons.person, size: 30),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome,',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      user.displayName!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      viewModel.navigationservice
                          .navigateTo(Routes.subscription);
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
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
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
                          child: viewModel.pickedImage != null
                              ? Image.file(
                                  viewModel.pickedImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Text(
                                    'No image selected',
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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
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
                        color: const Color.fromARGB(255, 221, 73, 73),
                        width: 3.0,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        iconSize: 50.0,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
