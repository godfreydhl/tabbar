import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: TabbedPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TabbedPage extends StatefulWidget {
  TabbedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage> with SingleTickerProviderStateMixin {
  int _counter = 0;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Popular Posts'),
    Tab(text: 'Travel'),
    Tab(text: 'Leisure'),
    Tab(text: 'Food'),
    Tab(text: 'Fashion')

  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         bottom: TabBar(
           controller: _tabController,
           tabs: myTabs,
         ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      )
    );
  }
}
