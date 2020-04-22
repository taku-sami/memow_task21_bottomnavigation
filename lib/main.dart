import 'package:flutter/material.dart';

void main() => runApp(MyApp());
int countNumber = 0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Text> _titles = <Text>[
    Text(''),
    Text('メニュー'),
    Text('設定'),
  ];

  void _onItemTopped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _switchScreen() {
    if (_selectedIndex == 0) {
      return Screen1();
    } else if (_selectedIndex == 1) {
      return Screen2();
    } else if (_selectedIndex == 2) {
      return Screen3();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('原牧場'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyStatefulWidget(),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: Text('全ての牛舎'),
            ),
            Container(
              height: 300.0,
            ),
          ],
        ),
      ),
      body: _switchScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('ホーム'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
            ),
            title: Text('メニュー'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('設定'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTopped,
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.green,
              child: Text('push'),
              onPressed: () {
                setState(() {
                  countNumber++;
                });
              },
            ),
            Text('$countNumber'),
            Text('スコープ外に変数を宣言すれば、画面をまたいでも変数を保持可能'),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('2'),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('3'),
    );
  }
}
