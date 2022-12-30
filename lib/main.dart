import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyHomePage extends StatelessWidget {
  final title = "Your Mental Health Companion";
  const MyHomePage({key, title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
          style: const TextStyle(fontSize: 22.5)),
          backgroundColor: Colors.black,
          toolbarHeight: 70,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 75,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.black,
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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
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
                  Tab(icon: Icon(Icons.emoji_people_outlined, size: 33)),
                  Tab(icon: Icon(Icons.people_alt_outlined, size: 33)),
                  Tab(icon: Icon(Icons.directions_bike, size: 33)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              //children: <Widget>[...] for many images
              children: [
                ListView(
                  children: <Widget>[
                    Image.asset('images/people-1.jpg'),
                    const Text(
                        'Go out! Meet a few people today',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 19.5),
                    ),
                    Image.asset('images/people-2.jpg'),
                    const Text(
                      'Listen to your favorite tracks!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 19.5),
                    ),
                    Image.asset('images/work.jpg'),
                    const Text(
                      'Find people with whom you could do something you love to do!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 19.5),
                    ),
                    Image.asset('images/raccoon-branch.jpg'),
                    const Text(
                      'You did good today, look forward to another productive day!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 19.5),
                    ),
                    const DialogExample(),
                    const DoubleBackToCloseApp(
                    snackBar: SnackBar(
                      content: Text('Tap Back Again To Exit The Application'),
                      ),
                      child: Center(
                          child: null
                      ),
                    )
                  ]
                ),
                const Icon(Icons.shield_moon_rounded,size: 55.0,),
                const Icon(Icons.people_alt_outlined,size: 55.0,),
                //Icon(Icons.directions_bike,size: 55.0,),
              ],
            ),
          ),
        )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Layout with Tabs',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const MyHomePage(title: "Drawer Layout with Tabs"),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Ready To Answer A Few Questions?'),
          content: const Text('It will only take a minute'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Not Now'),
              child: const Text('Not Now'),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const SecondRoute())),
              child: const Text('Yes!'),
            ),
          ],
        ),
      ),
      child: const Text("Take On Today's Mental Health Quiz!"),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Question Of The Day',
            style: TextStyle(fontSize: 22.5)
        ),
      ),
      body:
        ListView(
          children: const <Widget>[
          Text('')
        ]
      )
    );
  }
}