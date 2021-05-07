import 'package:flutter/material.dart';

class SimKwhScreen extends StatefulWidget {
  @override
  _SimKwhScreenState createState() => _SimKwhScreenState();
}

class _SimKwhScreenState extends State<SimKwhScreen> {
  var listElektronik = [];
  var totalDaya = 0.0;

  TextEditingController alatController = TextEditingController();
  TextEditingController dayaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  void _tambahData(String nama,int daya, int jumlah){
    double va;
    va = _hitungVA(daya, jumlah);
    setState(() {
      listElektronik.add({
        "namaAlat": nama, "daya": daya, "jumlah": jumlah, "jumlahVa": va
      });
      totalDaya = totalDaya + va;
    });
  }

  void _clearListScreen(){
    listElektronik.clear();
    alatController.clear();
    dayaController.clear();
    jumlahController.clear();
    totalDaya = 0.0;
  }

  void _hapusData(int indx){
    double va;
    va = listElektronik[indx]['jumlahVa'];
    setState(() {
      listElektronik.removeAt(indx);
      totalDaya= totalDaya-va;
    });
  }

  double _dayaPLN (double daya){
    double d = 0.0;

    if (daya <= 450){
      d= 450.0;
    }else if (daya > 450.0 && daya <= 900.0){
      d = 900.0;
    }else if (daya > 900.0 && daya <= 1300.0){
      d = 1300.0;
    }else if (daya > 1300.0 && daya <= 2200.0){
      d = 2200.0;
    }else if (daya > 2200.0 && daya <= 3500.0){
      d = 3500.0;
    }else if (daya > 3500.0 && daya <= 4400.0){
      d = 4400.0;
    }else if (daya > 4400.0 && daya <= 5500.0){
      d = 5500.0;
    }

    return d;
  }

  void _rekomendasi(double daya){
    var vaPLN ;
    vaPLN = _dayaPLN(daya);

    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                _clearListScreen();
          },
            child: Text("TUTUP"),
          )
        ],
        title: Text("Rekomendasi daya PLN"),
        content: Text("Total daya yang anda butuhkan adalah ${daya.toStringAsFixed(0)} VA. \n Anda dapat berlangganan daya ${vaPLN.toStringAsFixed(0)} VA."),
      );
    });
  }

  double _hitungVA(int daya,int jumlah){
    double hasil;
    hasil = (daya * jumlah)/ 0.85;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 5),
      child: ListView(
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.black54),
            controller: alatController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Alat Elektronik",
                hintText: "Alat Elektronik",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: dayaController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue[50],
              labelText: "Daya (watt)",
              hintText: "Daya (watt)",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: jumlahController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                labelText: "Jumlah (alat)",
                hintText: "Jumlah (alat)",
                border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/1.64555,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total kebutuhan daya :",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "${totalDaya.toStringAsFixed(0)} VA",
                        style: TextStyle(
                            color: Colors.black54,
//                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
//                  width: MediaQuery.of(context).size.width/1.71,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: ()=>_tambahData(alatController.text, int.parse(dayaController.text), int.parse(jumlahController.text)),
                        child: Container(
                          padding: EdgeInsets.all(10),
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
                              'TAMBAH',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: ()=> _rekomendasi(totalDaya),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.tealAccent, Colors.blueAccent[100]])),
                          child: Center(
                            child:Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: listElektronik.length,
                  itemBuilder: (context,index){
                    return Card(
                        elevation: 3,
                        color: Colors.green[50],
                        child: ListTile(
                          title: Text(listElektronik[index]['namaAlat']),
                          subtitle: Text("Jumlah :${listElektronik[index]['jumlah']} unit"),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.tealAccent,Colors.blueAccent[100]]

                                    )
                                ),
                                child: Text(listElektronik[index]['jumlahVa'].toStringAsFixed(0),style: TextStyle(
                                  color: Colors.white
                                ),)
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: ()=> _hapusData(index),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [Colors.tealAccent,Colors.blueAccent[100]]

                                        )
                                    ),
                                    child:Icon(
                                      Icons.delete_forever,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                  }),
          ),
        ],
      ),
    );
  }
}
