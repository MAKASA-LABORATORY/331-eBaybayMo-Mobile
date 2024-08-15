import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'subscription_message_viewmodel.dart';

class SubscriptionMessageView
    extends StackedView<SubscriptionMessageViewModel> {
  const SubscriptionMessageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscriptionMessageViewModel viewModel,
    Widget? child,
  ) {
    // Start navigation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.startNavigation();
    });

    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              Image.asset(
                'lib/resources/images/payment.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: ' Thank you for subscribing to our Premium Plan! ',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    WidgetSpan(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'lib/resources/images/confetti.png',
                            width: 22,
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: ' Enjoy the enhanced features and happy learning!',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SubscriptionMessageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SubscriptionMessageViewModel();
}
