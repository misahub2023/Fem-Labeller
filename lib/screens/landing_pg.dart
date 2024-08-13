import 'package:flutter/material.dart';
import 'package:ultrasound/screens/labeller.dart';
import 'package:ultrasound/screens/loading_screen.dart';
import 'package:ultrasound/utils/menu_drawer.dart';
import 'package:ultrasound/utils/size_configs.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const routeName = '/landing-screen';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30),
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'PCOS Labeller',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                'Welcome to PCOS Labeller Application. The application has been developed to collect medical annotations in the ultrasound images.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                'Please click on the testing module to view ultrasound images.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      Labeller.routeName); // LoadingScreen.routeName
                },
                child: Container(
                  height: getProportionateScreenHeight(80),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(4, 97, 147, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Go to Testing Module',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(90),
              ),
            ],
          ),
        ),
      ),
      drawer: const MenuDrawer(),
    );
  }
}
