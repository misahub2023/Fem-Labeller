import 'package:flutter/material.dart';
import 'package:ultrasound/auth/logout.dart';
import 'package:ultrasound/screens/landing_pg.dart';
import 'package:ultrasound/screens/loading_screen.dart';
import 'package:ultrasound/screens/profile.dart';
import 'package:ultrasound/utils/size_configs.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(188, 214, 228, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(45),
        ),
        const Center(
          child: Text(
            'PCOS Labeller',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }

  buildMenuItems(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Testing Module',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen() //user: FirebaseServices.currentUser),
                  ),
            );
            // print(FirebaseServices.currentUser);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Logout.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
