import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/ui/views/subscription_page/subscription_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SubscriptionPageView extends StackedView<SubscriptionPageViewModel> {
  const SubscriptionPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscriptionPageViewModel viewModel,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 105.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Plan',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SubscriptionPlanCard(
                planTitle: 'Free',
                price: 'P/0 month',
                description: 'Individual character Recognition',
                buttonText: 'Current Plan',
                buttonColor: Colors.grey,
                onPressed: () {
                  // Handle current plan action
                },
              ),
              const SizedBox(height: 20),
              SubscriptionPlanCard(
                planTitle: 'Premium',
                price: 'P299 for 1 month',
                description: 'Complete Word Recognition',
                buttonText: 'Get Premium',
                buttonColor: const Color(0xFFA52A2A),
                onPressed: () {
                  _showConfirmationDialog(context, viewModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, SubscriptionPageViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Upgrade"),
          content: const Text(
              "Are you sure you want to upgrade to the Premium plan?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFA52A2A),
                        ),
                      ),
                    );
                  },
                );

                Future.delayed(const Duration(seconds: 2), () {
                  viewModel.navigationservice.navigateTo(Routes.success_page);
                });
              },
              child: const Text(
                "Proceed",
                style: TextStyle(
                  color: Color(0xFFA52A2A),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  SubscriptionPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SubscriptionPageViewModel();
}

class SubscriptionPlanCard extends StatelessWidget {
  final String planTitle;
  final String price;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const SubscriptionPlanCard({
    Key? key,
    required this.planTitle,
    required this.price,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Color(0xFFA52A2A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• $description',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
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
}
