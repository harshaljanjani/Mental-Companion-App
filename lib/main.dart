import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() => runApp(const MyApp());

class MyHomePage extends StatelessWidget {
  final title = "Your Mental Health Companion";
  const MyHomePage({key, title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
          style: const TextStyle(fontSize: 22.5)
          ),
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
                    const ListTile(
                        title: Text(
                        'Go out! Meet a few people today',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 19.5),
                    ),
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
                    const QuizDialog(),
                    const DoubleBackToCloseApp(
                    snackBar: SnackBar(
                      content: Text('Tap Back Again To Exit The Application'),
                      ),
                      child: Center(
                          child: null
                      ),
                    )
                  ],
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

class QuizDialog extends StatelessWidget {
  const QuizDialog({super.key});
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
              onPressed: (){
                Navigator.pop(context, 'Not Now');
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
              },
              child: const Text('Not Now'),
            ),
            TextButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
                Navigator.push(context,MaterialPageRoute(builder: (context) => const QuestionsPage()));
                },
              child: const Text('Yes!'),
            ),
          ],
        ),
      ),
      child: const Text("Take On Today's Mental Health Quiz!"),
    );
  }
}

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFffdc00), Colors.deepOrange]),
          ),
          child: ListView(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(15,0,15,0),
                  child: Text('\n\n\nHow Many People Did You Meet Today?\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold)
                )
                ),
                //SliderExample(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(4,20,0,0),
                  child: SliderExample(),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25,150,25,0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {Navigator.pop(context);},
                      child: const Text('NEXT', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
                    )
                )
              ]
          ),
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  final double _min = 0;
  final double _max = 20;
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfSliderTheme(
          data: SfSliderThemeData(
            trackCornerRadius: 10,
            thumbColor: Colors.white,
            thumbRadius: 20,
            activeTrackHeight: 40,
            inactiveTrackHeight: 40,
            tooltipTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            tooltipBackgroundColor: Colors.white,
            inactiveTrackColor: Colors.blue,
            activeTrackColor: Colors.blue,
            activeLabelStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            inactiveLabelStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)
          ),
        child: SfSlider(
          thumbIcon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 28
          ),
          min: _min,
          max: _max,
          value: _value,
          interval: 2,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          tooltipShape: const SfPaddleTooltipShape(),
          minorTicksPerInterval: 1,
          onChanged: (dynamic newValue) {
            setState(() {
              _value = newValue;
            });
          },
        )
        )
    );
  }
}