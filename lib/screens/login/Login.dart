import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/home/Home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? 'assets/images/Logo_light.png'
                  : 'assets/images/Logo_dark.png',
              height: 146,
            ),
            Spacer(),
            PrimaryButton(
                text: 'Sign In',
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()))),
            SizedBox(
              height: kDefaultPadding * 1.5,
            ),
            PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: 'Sign Up',
                press: () {}),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      )),
    );
  }
}