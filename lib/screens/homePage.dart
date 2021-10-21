import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String apiUrl =
      "https://cdn-api.cov-in.in/api/v2/appointment/sessions/public/calendarByPin?pincode=";

  TextEditingController date = new TextEditingController();
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    print(currentDate);
  }

  // Future<String> resData(String pin, String date) async {
  //   var response = await http.get(apiUrl);
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/1.jpeg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fitHeight,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Enter PinCode",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: TextField(
                      controller: date,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Select Date",
                          hintStyle: TextStyle(color: Colors.black)),
                      onTap: () {
                        _selectDate(context);
                      }),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    // call ui api here
                  },
                  child: Text("SEARCH"),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
