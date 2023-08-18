import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final Widget child;

  const Splash({Key? key, required this.child}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget.child)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/splash.png')),
        ],
      ),
    );
  }
}
