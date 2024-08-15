import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'about_page_viewmodel.dart';

class AboutPageView extends StackedView<AboutPageViewModel> {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0), // Add left padding
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFA52A2A),
              size: 30, // Enlarge the back arrow icon
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'lib/resources/images/man_thinking.png',
              height: 300,
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'eBaybayMo',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: const Color(0xFFA52A2A),
                    ),
                  ),
                  TextSpan(
                    text:
                        ' creates a Baybayin translator for the continuity of the Filipino alphabetic culture. An app that uses machine learning to recognize Baybayin characters and convert them into letters. Capture Baybayin character, and the app converts it instantly.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AboutPageViewModel viewModelBuilder(BuildContext context) =>
      AboutPageViewModel();
}
