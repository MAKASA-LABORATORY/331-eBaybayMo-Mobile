import 'package:ebaybaymo/app/app.router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'sign_in_viewmodel.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Main content of the page
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFA52A2A),
                          width: 1.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/resources/images/logo_ebaybaymo.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'eBaybayMo',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: const Color(0xFFA52A2A),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in to your account',
                          style: GoogleFonts.poppins(
                            fontSize: 21,
                            color: const Color(0xFFA52A2A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email Address',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      cursorColor: Colors.black,
                      onChanged: viewModel.onEmailChanged,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        errorText: viewModel.showEmailError
                            ? viewModel.validateEmailField()
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: !viewModel.isPasswordVisible,
                      cursorColor: Colors.black,
                      onChanged: viewModel.onPasswordChanged,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        errorText: viewModel.showPasswordError
                            ? viewModel.validatePasswordField()
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(viewModel.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot your password?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isEmailValid =
                              viewModel.validateEmailField() == null;
                          bool isPasswordValid =
                              viewModel.validatePasswordField() == null;

                          if (isEmailValid && isPasswordValid) {
                            setState(() {
                              _isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            setState(() {
                              _isLoading = false;
                            });
                            viewModel.signIn();
                          } else {
                            viewModel.triggerValidation();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color(0xFFA52A2A),
                        ),
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'other way to sign in',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            viewModel.onGoogleLogoTapped();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                'lib/resources/images/logo_google.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            viewModel.onFacebookLogoTapped();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                'lib/resources/images/fb.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: ' Create Account',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xFFA52A2A),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    viewModel.navigationservice
                                        .navigateTo(Routes.sign_up);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Loading overlay
            Visibility(
              visible: _isLoading,
              child: Stack(
                children: [
                  // Dimmed background
                  Container(
                    color: Colors.black.withOpacity(0.5), // Dim the whole page
                    child: Center(
                      child: Container(
                        color: Colors.white.withOpacity(
                            0.8), // Slightly transparent white background
                        padding: const EdgeInsets.all(16),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              color: Color(0xFFA52A2A),
                              strokeWidth: 5,
                            ),
                            SizedBox(
                                width:
                                    16), // Add space between the spinner and the text
                            Text(
                              'Loading',
                              style: TextStyle(
                                color: Colors
                                    .black, // Text color to contrast with white background
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
