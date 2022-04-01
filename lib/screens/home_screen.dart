import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/root_component.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Future _getUserDetailsFromAPI = Future<String>.delayed(
      const Duration(seconds: 2),
      () {
        // Setting the user values temporarily according to the firebase user values
        // Do API calls here
        context.read<UserProvider>().setUserFromUserPassword(
            auth.currentUser?.email ?? "",
            auth.currentUser?.displayName ?? "",
            auth.currentUser?.phoneNumber ?? "",
            0,
            0);
        return "Data Loaded";
      },
    );

    return FutureBuilder(
      future: _getUserDetailsFromAPI,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return const RootComponent();
        } else if (snapshot.hasError) {
          return const ErrorComponent();
        } else {
          return const LoadingComponent();
        }
      },
    );
  }
}

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Some error occurred"),
        ),
      ),
    );
  }
}

// class RootComponent extends StatelessWidget {
//   const RootComponent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth auth = FirebaseAuth.instance;

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: AppColors.uiStatusBarColor,
//         systemNavigationBarColor: Colors.white,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         // For Android.
//         // Use [light] for white status bar and [dark] for black status bar.
//         statusBarIconBrightness: Brightness.light,
//         // For iOS.
//         // Use [dark] for white status bar and [light] for black status bar.
//         statusBarBrightness: Brightness.dark,
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: GradientColors.japanBlush,
//               ),
//             ),
//             // decoration: const BoxDecoration(
//             //   gradient: LinearGradient(
//             //       begin: Alignment.bottomRight,
//             //       end: Alignment.topLeft,
//             //       colors: <Color>[Colors.white,Colors.white70,Colors.white60,Colors.white38, Colors.orangeAccent,Colors.deepOrangeAccent,Colors.deepOrange]),
//             // ),
//           ),
//           backgroundColor: Colors.white70,
//           toolbarOpacity: 0.8,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 await Auth(authInstance: auth).logoutUser();
//                 Navigator.pushReplacementNamed(context, '/welcome');
//               },
//               icon: const Icon(Icons.exit_to_app),
//               color: Colors.black87,
//               iconSize: 30,
//               key: const Key('logoutButton'),
//             ),
//           ],
//           leading: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.menu),
//             color: Colors.black87,
//             iconSize: 30,
//             key: const Key('menuButtonHomeScreen'),
//           ),
//           title:
//               const Text('Home Screen', style: TextStyle(color: Colors.black)),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.orangeAccent,
//                   Color(0xFFCA436B),
//                   Color(0xFF915FB5),
//                   Colors.indigoAccent
//                 ],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight,
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   Holdings(),
//                   Support(),
//                   More(),
//                   // context.watch<UserProvider>().isUserLoggedIn ? Text("Home ${context.watch<UserProvider>().loggedInUser?.fullName}") : const Text("You are logged out"),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
