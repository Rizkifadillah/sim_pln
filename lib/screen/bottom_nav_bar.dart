import 'package:flutter/material.dart';
import 'package:simulasi_pemakaian_listrik/screen/simulasi_beli_token.dart';
import 'package:simulasi_pemakaian_listrik/screen/simulator_kwh.dart';
import 'package:simulasi_pemakaian_listrik/screen/simulator_pasang_baru.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedTab = 0;

  void _onTapedTab(int index){
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      SimKwhScreen(),
      SimPassangBaru(),
      SimBeliToken()
    ];

    final _menuItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.device_unknown),title: Text("Daya")),
      BottomNavigationBarItem(icon: Icon(Icons.wb_incandescent),title: Text("Pasang Baru")),
      BottomNavigationBarItem(icon: Icon(Icons.card_membership),title: Text("Beli Token"))
    ];

    final _bottomBar = BottomNavigationBar(
      items: _menuItem,
      currentIndex: _selectedTab,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onTapedTab,
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.flash_on,
          color: Colors.amber,
        ),
//        centerTitle: true,
        title: Center(
          child: Row(
            children: <Widget>[
              Text("Sim",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.black26
              ),),
              Text("PLi",style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  color:Colors.blue
              ),),
            ],
          ),
        ),
      ),
      body: Center(
        child: _listPage[_selectedTab],
      ),
      bottomNavigationBar: _bottomBar,
    );
  }
}
