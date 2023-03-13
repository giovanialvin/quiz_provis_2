import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String pilihTanggal = "1 Januari 2023";
  String tanggalOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> tanggal = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "1 Januari 2023",
      child: Text("1 Januari 2023"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "2 Januari 2023",
      child: Text("2 Januari 2023"),
    );
    tanggal.add(itm1);
    tanggal.add(itm2);

    return MaterialApp(
      title: 'Quiz Flutter',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: ListView(
          children: [
            Column(
              children: [
                //dropdown section
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back),
                      DropdownButton(
                        value: pilihTanggal,
                        items: tanggal,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              pilihTanggal = newValue;
                              tanggalOut = pilihTanggal;
                            }
                          });
                        },
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),

                // output
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  tanggalOut,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),

                // garis between section
                SizedBox(
                  height: 2,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),

                // section ke 2
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.car_repair),
                          ),
                          Text(
                            "10 km \n 20 jam, 30 menit",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.directions_walk),
                          ),
                          Text(
                            "20 km \n 40 jam, 20 menit",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.electric_bike),
                          ),
                          Text(
                            "2 km \n 2 jam",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // garis between section
                SizedBox(
                  height: 2,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),

                //Listview
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Walking"),
                          subtitle: Text("3 km,"),
                          leading: Container(
                              child: Image.network(
                            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                          )),
                          trailing: Icon(Icons.more_vert),
                        ),
                        SizedBox(
                          height: 5,
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ), // Spacer/margin antara dua row

                        ListTile(
                          title: Text("Driving"),
                          subtitle: Text("10 km,"),
                          leading: Container(
                              child: Image.network(
                            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                          )),
                          trailing: Icon(Icons.more_vert),
                        ),
                        SizedBox(
                          height: 5,
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ), // Spacer/margin antara dua row
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 5'),
            content: const Text('M. Aditya H.P. (mdhstama@upi.edu) ; Alvin Giovani (alvingiovani17@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
