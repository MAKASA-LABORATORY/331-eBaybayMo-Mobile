import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'check_auth_viewmodel.dart';

class CheckAuthView extends StackedView<CheckAuthViewModel> {
  const CheckAuthView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(CheckAuthViewModel viewModel) {
    super.onViewModelReady(viewModel);
    // Call the function to check both custom API and Google sign-in authentication
    viewModel.checkAuthentication();
  }

  @override
  Widget builder(
    BuildContext context,
    CheckAuthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: viewModel.isLoading
            ? const CircularProgressIndicator()
            : const SizedBox.shrink(), // Replace with other widgets if needed
      ),
    );
  }

  @override
  CheckAuthViewModel viewModelBuilder(BuildContext context) =>
      CheckAuthViewModel();
}
