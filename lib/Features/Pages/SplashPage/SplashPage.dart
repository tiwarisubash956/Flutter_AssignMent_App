import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignmentapp/Configuration/routes/app_router.gr.dart';

@RoutePage()

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Trigger navigation after a delay to simulate splash screen behavior
    context.router.push(const HomeRoute());
    Future.delayed(const Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Flutter Gallery",
                style: TextStyle(
                  fontFamily: 'BreeSerif',
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                "“image of quality”",
                style: TextStyle(
                  fontFamily: 'BreeSerif',
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
