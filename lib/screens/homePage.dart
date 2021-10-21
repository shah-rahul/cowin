import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
var pin=TextEditingController();
var dateString="03062021";

class _MyHomePageState extends State<MyHomePage> {
  
@override
void initState(){
  pin.text="835223";
}
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
      dateString="${currentDate.day.toString().padLeft(2,'0')}+${currentDate.month.toString().padLeft(2,'0')}+${currentDate.year.toString()}";
  }

  Future<String> resData(String pin, String date) async {
    final apiUrl = Uri.parse("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pin&date=$dateString");
    print('searching pin $pin');
    var response = await http.get(apiUrl);
    await http
        .get(apiUrl);
    var jsonresp = jsonDecode(response.body);
    print(jsonresp.toString());
    return 'GOT IT';
  }

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
                    controller: pin,
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
                    resData(pin.text,'21102021');
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
