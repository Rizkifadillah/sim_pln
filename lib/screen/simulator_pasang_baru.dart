import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SimPassangBaru extends StatefulWidget {
  @override
  _SimPassangBaruState createState() => _SimPassangBaruState();
}

class _SimPassangBaruState extends State<SimPassangBaru> {
  String _keterangan = "";

  final price = NumberFormat("#,##0",'en_US');


  TextEditingController dayaVAController = TextEditingController();

  _hitungBiaya (double daya){
    double d = 0.0;

    if (daya <= 450){
      d = 421000;
    }else if(daya >= 900 && daya  <= 2200){
      d = daya*937;
    }else if(daya >= 3500 && daya  <= 82500){
      d = daya*969;
    }else if(daya >= 10500 && daya  <= 197000){
      d = daya*775;
    }
    setState(() {
      _keterangan =" Nilai BP yang harus dibayarkan \n Rp ${d.toStringAsFixed(0)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: dayaVAController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Total daya rumah anda (VA)",
                hintText: "Masukan daya (VA)",
                border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => _hitungBiaya(double.parse(dayaVAController.text)),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.tealAccent,Colors.blueAccent[100]]

                  )
              ),
              child: Center(
                child: Text('Hitung nilai biaya penyabungan (BP)', style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 3,
          ),
          SizedBox(
            height: 50,
          ),
          _keterangan.isNotEmpty ? Container(
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
            child: Text(
              _keterangan.isNotEmpty ? _keterangan : "",
              style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ): Container()
        ],
      ),
    );
  }
}
