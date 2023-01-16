import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_companion/screens/login_page.dart';
import 'PhotosList.dart';
import 'app_widget.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  final title = "Your Mental Health Companion";
  const HomePage({key, title}) : super(key: key);
  //URL LaunchInBrowser Functionality
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,))
    {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
          style: const TextStyle(fontSize: 22.5, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 70,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.whatshot_rounded,
                  size: 34,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 75,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.yellow,
                          Colors.red,
                          Colors.indigo,
                          Colors.teal,
                        ],
                      )
                  ),
                  child: Text(
                    "Options",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                    textAlign: TextAlign.justify,
                    textScaleFactor: 1.7,
                  ),
                )
              ),
              Image.asset('images/peace.jpg'),
              ListTile(
                title: const Text(
                    "Get Professional Help",
                    style: TextStyle(fontSize: 18)
                ),
                onTap: () {
                  final Uri toLaunch = Uri(scheme: 'https', host: 'www.vandrevalafoundation.com');
                  _launchInBrowser(toLaunch);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                    "Clear All Accounts",
                    style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              actions: const <Widget>[],
              title: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.greenAccent),
                tabs: const [
                  Tab(icon: Icon(Icons.emoji_people_outlined, size: 33, color: Colors.white)),
                  Tab(icon: Icon(Icons.people_alt_outlined, size: 33, color: Colors.white)),
                  Tab(icon: Icon(Icons.auto_graph, size: 33, color: Colors.white)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              //children: <Widget>[...] for many images
              children: [
                ListView(
                  children: const <Widget>[
                    PhotosList(),
                    QuizDialog(),
                    DoubleBackToCloseApp(
                    snackBar: SnackBar(
                      content: Text('Tap Back Again To Exit The Application'),
                      ),
                      child: Center(
                          child: null
                      ),
                    )
                  ],
                ),
                const Icon(Icons.people_alt_outlined,size: 55.0,),
                const Icon(Icons.auto_graph,size: 55.0,),
                //Icon(Icons.directions_bike,size: 55.0,),
              ],
            ),
          ),
        )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(),
    );
  }
}

class QuizDialog extends StatelessWidget {
  const QuizDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Get Ready To Capture Your Emotion!'),
          content: const Text('It will only take seconds'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.pop(context, 'Not Now');
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
              },
              child: const Text('Not Now'),
            ),
            TextButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
                Navigator.push(context,MaterialPageRoute(builder: (context) => const EmotionWidget()));
                },
              child: const Text('Yes!'),
            ),
          ],
        ),
      ),
      child: const Text("MoodCheck©", style: TextStyle(fontSize: 18)),
    );
  }
}











