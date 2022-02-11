import 'package:chat/constants.dart';
import 'package:chat/screens/login/Login.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset('assets/images/welcome_image.png'),
            Spacer(
              flex: 3,
            ),
            Text(
              'Welcome to the Social Metaverse',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              'Feel free to explore the app and get to know the community.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.65),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Row(
                    children: [
                      Text(
                        'Get started',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.8)),
                      ),
                      SizedBox(
                        width: kDefaultPadding / 4,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.8),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
