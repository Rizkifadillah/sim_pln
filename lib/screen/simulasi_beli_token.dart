import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimBeliToken extends StatefulWidget {
  @override
  _SimBeliTokenState createState() => _SimBeliTokenState();
}

class _SimBeliTokenState extends State<SimBeliToken> {

  double nilaikWh = 0.0;

  TextEditingController nominalController = TextEditingController();
  TextEditingController tarifController = TextEditingController();
  TextEditingController ppjController = TextEditingController();
  TextEditingController adminController = TextEditingController();

  _hitungkWh(double nominal,double tarif, double ppj, double admin){
    double kwh = 0.0;
    kwh = ((nominal - admin) / ((100 +ppj) / 100)) / tarif;
    print(" Nilai kwh $kwh");
    setState(() {
      nilaikWh = kwh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 5),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black54),
            controller: nominalController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Nominal Token (Rp)",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: tarifController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue[50],
              labelText: "Tarif berlaku(Rp/kWh)",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: ppjController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Pajak Penerangan Jalan (PPJ)(%)",
                border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: adminController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Admin Bank/PPOB(Rp)",
                border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => _hitungkWh(
              double.parse(nominalController.text),
              double.parse(tarifController.text),
              double.parse(ppjController.text),
              double.parse(adminController.text),
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.tealAccent,
                        Colors.blueAccent[100]
                      ])),
              child: Center(
                child: Text(
                  'Hitung kWh',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 3,),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.tealAccent,Colors.blueAccent[100]]

                )
            ),
            child: Text("Total kWh yang di dapat : ${nilaikWh.toStringAsFixed(0)} kWh",
              style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
