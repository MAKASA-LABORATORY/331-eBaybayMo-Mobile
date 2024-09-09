import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFA52A2A),
              size: 30,
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
            const SizedBox(height: 30),
            SizedBox(
              height: 270,
              child: Lottie.asset(
                'lib/resources/images/question.json',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            // Wrap the RichText in a FadeInRichText widget
            const FadeInRichText(),
          ],
        ),
      ),
    );
  }

  @override
  AboutPageViewModel viewModelBuilder(BuildContext context) =>
      AboutPageViewModel();
}

class FadeInRichText extends StatefulWidget {
  const FadeInRichText({Key? key}) : super(key: key);

  @override
  _FadeInRichTextState createState() => _FadeInRichTextState();
}

class _FadeInRichTextState extends State<FadeInRichText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // Start the animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: RichText(
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
                  ' an app that uses machine learning to translate Baybayin characters into letters while building a community committed to preserving and celebrating Filipino script. Capture Baybayin characters with the app for instant translation and engage in a movement to revive this cultural heritage.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
