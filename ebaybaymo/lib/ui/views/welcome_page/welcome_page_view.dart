import 'package:ebaybaymo/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'welcome_page_viewmodel.dart';

class WelcomePageView extends StackedView<WelcomePageViewModel> {
  const WelcomePageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomePageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFA52A2A),
                  width: 1.5,
                ),
              ),
              child: const CircleAvatar(
                radius: 130,
                backgroundImage:
                    AssetImage('lib/resources/images/logo_ebaybaymo.png'),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'eBaybayMo',
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFA52A2A),
                shadows: [
                  Shadow(
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'An app that uses machine learning to recognize Baybayin characters and convert them into letters.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromARGB(137, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.navigationservice.navigateTo(Routes.sign_in);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA52A2A),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA52A2A),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  WelcomePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomePageViewModel();
}
