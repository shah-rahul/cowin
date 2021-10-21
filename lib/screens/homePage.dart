import 'package:cowin_tracker/screens/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'myGlobals.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    pin.text = "";
  }

  TextEditingController date = new TextEditingController();
  
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
    date.text= "${currentDate.day.toString().padLeft(2, '0')}/${currentDate.month.toString().padLeft(2, '0')}/${currentDate.year.toString()}";
    dateString =
        "${currentDate.day.toString().padLeft(2, '0')}${currentDate.month.toString().padLeft(2, '0')}${currentDate.year.toString()}";
  }

  Future<String> resData(String pin, String date) async {
    final apiUrl = Uri.parse(
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pin&date=$dateString");
            //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=835223&date=03062021

    print('searching pin $pin');
    var response = await http.get(apiUrl);
    await http.get(apiUrl);
    var jsonresp = jsonDecode(response.body);
    print(jsonresp.toString());
    var returnData = jsonresp.toString();
    return response.body.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Cowin Tracker")),
        body: Stack(
          children: [
            Image.asset(
              "assets/1.jpeg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.36,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: GestureDetector(
                        child: TextField(
                          enabled: false,
                            controller: date,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Select Date",
                                hintStyle: TextStyle(color: Colors.black)),
                            ),
                            onTap: () {
                              _selectDate(context);
                            }
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.deepPurple,
                      onPressed: () async {
                        var result = await resData(pin.text, '21102021');

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  result: result,
                                )));
                      },
                      child: Text("SEARCH", style: TextStyle(color:Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class Data {}
