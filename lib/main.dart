import 'package:flutter/material.dart';
import 'package:kicodes/constants/my_images.dart';
import 'package:kicodes/constants/my_strings.dart';
import 'package:kicodes/splash_screen.dart';
import 'package:kicodes/web_view/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiCodes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
        '/webview': (context) => WebViewPage(url: MyStrings.gitHubUrl),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple, // Start color
                Colors.deepPurple, // End color
              ],
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                width: mediaQuery.width,
                height: mediaQuery.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 15.0,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          MyImages.slackImg,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 15,
                      color: Colors.transparent,
                      child: Text(
                        MyStrings.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black, // Start color
                            Colors.black45, // End color
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(15),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/webview');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(MyImages.gitHubLogo, width: 15, color: Colors.white,),
                            Text(MyStrings.openGithub, style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
