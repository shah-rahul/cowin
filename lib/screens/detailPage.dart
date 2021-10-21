import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'myGlobals.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  var result;

  DetailsPage({Key? key, required this.result}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

List<Map<String, Object>>? centers;
var available_dates = [[]];

class _DetailsPageState extends State<DetailsPage> {
  @override
  var limiteditems = [];
  var unlimiteditems = [];
  void initState() {
    if(jsonDecode(widget.result).containsKey('centers')){
    for (var i = 0; i < jsonDecode(widget.result)["centers"].length; i++) {
      unlimiteditems = [];
      limiteditems = [];
      for (var j = 0;
          j < jsonDecode(widget.result)["centers"][i]['sessions'].length;
          j++) {
        if (jsonDecode(widget.result)['centers'][i]['sessions'][j]
            .containsKey('max_age_limit')) {
          limiteditems += [
            jsonDecode(widget.result)['centers'][i]['sessions'][j]['date']
          ];
        } else {
          unlimiteditems += [
            jsonDecode(widget.result)['centers'][i]['sessions'][j]['date']
          ];
        }
      }
      available_dates += [limiteditems];
      available_dates += [unlimiteditems];
    }
    print(available_dates.toString());
    }
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cowin Tracker")),
        body: 
        
        !jsonDecode(widget.result).containsKey('centers')?
        Center(
          child: Text("Enter valid data!", style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color.fromRGBO(25, 48, 195, 1)))),
        )  : 

        
        jsonDecode(widget.result)["centers"].length==0? 
        
        Center(
          child: Text("No results found!", style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color.fromRGBO(25, 48, 195, 1)))),
        )  : 


        
        ListView.builder(
          itemCount: jsonDecode(widget.result)["centers"].length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
      BoxShadow(
        spreadRadius: 2,
        color: Color.fromRGBO(100, 100, 100, 0.2),
        offset: Offset(0, 0),
        blurRadius: 3,
      )
    ],
                        ),
                    padding: EdgeInsets.all(
                      20,
                    ),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              jsonDecode(widget.result)["centers"][index]
                                      ['center_id']
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color.fromRGBO(25, 48, 195, 1))),
                            ),
                            Text(
                              "Age 45+    ",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color.fromRGBO(25, 48, 195, 1))),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          jsonDecode(widget.result)["centers"][index]['name']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        Text(
                          jsonDecode(widget.result)["centers"][index]['address']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        Text(
                          jsonDecode(widget.result)["centers"][index]
                                  ['block_name']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 0)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 0)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 1)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 1)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 2)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 2)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 3)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 3)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 4)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 4)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 5)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 5)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 6)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 6)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                        ])
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
        spreadRadius: 2,
        color: Color.fromRGBO(100, 100, 100, 0.2),
        offset: Offset(0, 0),
        blurRadius: 3
      )]),
                    padding: EdgeInsets.all(
                      20,
                    ),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              jsonDecode(widget.result)["centers"][index]
                                      ['center_id']
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color.fromRGBO(25, 48, 195, 1))),
                            ),
                            Text(
                              "Age 18-44    ",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color.fromRGBO(25, 48, 195, 1))),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          jsonDecode(widget.result)["centers"][index]['name']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        Text(
                          jsonDecode(widget.result)["centers"][index]['address']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        Text(
                          jsonDecode(widget.result)["centers"][index]
                                  ['block_name']
                              .toString(),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(54, 225, 209, 1))),
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 0)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 0)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 1)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 1)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 2)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 2)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 3)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 3)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 4)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 4)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 5)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 5)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                                      Container(
                              padding:
                                  EdgeInsets.only(top: 2, bottom: 2, left: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(31, 47, 133, 1))),
                              child: Text(
                                  "${currentDate.add(const Duration(days: 6)).day.toString()} ${DateFormat('MMM').format(currentDate.add(const Duration(days: 6)))}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                      color: Color.fromRGBO(39, 61, 198, 1)))),
                        ])
                      ],
                    )),
              ],
            );
          },
        ));
  }
}
