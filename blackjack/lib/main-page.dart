import 'package:flutter/material.dart';

List<String> months = [
  "January",
  "February",
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
List<String> weekDays = [
  "Mon",
  "Tue",
  'Wed',
  'Thur',
  'Fri',
  'Sat',
  'Sun',
];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int _currentMonth = 0;
  void tap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentMonth != 0
                            ? _currentMonth--
                            : _currentMonth = 0;
                      });
                    },
                    icon: Icon(Icons.arrow_left),
                  ),
                  Text(months[_currentMonth]),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentMonth != 11
                            ? _currentMonth++
                            : _currentMonth = 0;
                      });
                    },
                    icon: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey[200],
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(weekDays[0]),
                            Text(weekDays[1]),
                            Text(weekDays[2]),
                            Text(weekDays[3]),
                            Text(weekDays[4]),
                            Text(weekDays[5]),
                            Text(weekDays[6]),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            MaterialButton(
                              child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: tap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            title: Text(
              'Schedule',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("add"),
          ),
        ],
      ),
    );
  }
}
