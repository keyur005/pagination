
import 'package:flutter/material.dart';
import 'package:pagination/design_strip/model/tab_model.dart';

import 'package:pagination/design_strip/widget/color_chip.dart';


class DesignStrip extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DesignStrip>
     {


  String _selectedColor;
  String _selectedColor1;
  String _selectedColor2;
  String _selectedColor3;
  String _selectedColor4;

  String _selectedId;
  String _selectedId1;
  String _selectedId2;
  String _selectedId3;
  String _selectedId4;

  List<Tabs> colorList = new List();
  List<Tabs> colorList1 = new List();
  List<Tabs> colorList2 = new List();
  List<Tabs> colorList3 = new List();
  List<Tabs> colorList4 = new List();


  @override
  void initState() {
   colorList.add(Tabs(color:"0xff448488", id: 1,));
   colorList.add(Tabs(color:"0xff47C9B0", id: 2,));
   colorList.add(Tabs(color:"0xffCACFD2", id: 3,));
   colorList.add(Tabs(color:"0xff448488", id: 4,));
   colorList.add(Tabs(color:"0xffE3470D", id: 5,));
   colorList.add(Tabs(color:"0xff545454", id: 6,));



    colorList1.add(Tabs(color: "0xff40E0D0", id: 13,));
    colorList1.add(Tabs(color: "0xff9FE2BF", id: 52,));
    colorList1.add(Tabs(color: "0xffDE3163", id: 37,));
    colorList1.add(Tabs(color: "0xffFF7F50", id: 455));
    colorList1.add(Tabs(color: "0xffFFBF00", id: 50,));
    colorList1.add(Tabs(color: "0xffDFFF00", id: 69,));


    colorList2.add(Tabs(color:"0xff196F3D", id: 145,));
    colorList2.add(Tabs(color:"0xff47C9B0", id: 72,));
    colorList2.add(Tabs(color:"0xffCACFD2", id: 367,));
    colorList2.add(Tabs(color:"0xff85929E", id: 45,));
    colorList2.add(Tabs(color:"0xffBDC3C7", id: 50,));
    colorList2.add(Tabs(color:"0xffE59866", id: 68,));



    colorList3.add(Tabs(color:"0xff448488", id: 11,));
    colorList3.add(Tabs(color:"0xffEB984E", id: 22,));
    colorList3.add(Tabs(color:"0xffF4D03F", id: 33,));
    colorList3.add(Tabs(color:"0xff73C6B6", id: 44,));
    colorList3.add(Tabs(color:"0xff448488", id: 55,));
    colorList3.add(Tabs(color:"0xffA2D9CE", id: 66,));



   colorList4.add(Tabs(color:"0xff448488", id: 001,));
   colorList4.add(Tabs(color:"0xffA3E4D7", id: 982,));
   colorList4.add(Tabs(color:"0xff2980B9", id: 273,));
   colorList4.add(Tabs(color:"0xff76448A", id: 04,));
   colorList4.add(Tabs(color:"0xffCB4335", id: 35,));
   colorList4.add(Tabs(color:"0xffCCCCFF", id: 66,));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 85,
                    ),
                    Container(
                      // margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(int.parse(_selectedColor ?? "0xff545454")),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //  margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color:
                            Color(int.parse(_selectedColor1 ?? "0xffDFFF00")),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //  margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color:
                            Color(int.parse(_selectedColor2 ?? "0xffE59866")),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //  margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color:
                            Color(int.parse(_selectedColor3 ?? "0xffA2D9CE")),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //  margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color:
                            Color(int.parse(_selectedColor4 ?? "0xffCCCCFF")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Hardess(pps)"),
                              Container(
                                child: Center(child: Text(_selectedId ?? "0")),
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 55,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Center(
                                      child: ColorSelectChip(
                                        colorList,
                                        selectedColor: _selectedColor ??
                                            colorList.first.toString(),
                                        //  selectedColor:colorList.first,
                                        onSelectionChanged:
                                            (String selectedList, String id) {
                                          setState(() {
                                            _selectedId = id;
                                            _selectedColor = selectedList;
                                            print(selectedList);
                                          });
                                        },
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Chiornie (pps)"),
                              Container(
                                child: Center(child: Text(_selectedId1 ?? "0")),
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 55,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Center(
                                      child: ColorSelectChip(
                                        colorList1,
                                        selectedColor: _selectedColor1 ??
                                            colorList1.first.toString(),
                                        //  selectedColor:colorList.first,
                                        onSelectionChanged:
                                            (String selectedList, String id) {
                                          setState(() {
                                            _selectedId1 = id;
                                            _selectedColor1 = selectedList;
                                            print(selectedList);
                                          });
                                        },
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Free Chiorine(pps)"),
                              Container(
                                child: Center(child: Text(_selectedId2 ?? "1")),
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 55,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Center(
                                      child: ColorSelectChip(
                                        colorList2,
                                        selectedColor: _selectedColor2 ??
                                            colorList2.first.toString(),
                                        onSelectionChanged:
                                            (String selectedList, String id) {
                                          setState(() {
                                            _selectedId2 = id;
                                            _selectedColor2 = selectedList;
                                            print(selectedList);
                                          });
                                        },
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("pH(pps)"),
                              Container(
                                child: Center(child: Text(_selectedId3 ?? "0")),
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 55,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Center(
                                      child: ColorSelectChip(
                                        colorList3,
                                        selectedColor: _selectedColor3 ??
                                            colorList3.first.toString(),
                                        //  selectedColor:colorList.first,
                                        onSelectionChanged:
                                            (String selectedList, String id) {
                                          setState(() {
                                            _selectedId3 = id;
                                            _selectedColor3 = selectedList;
                                            print(selectedList);
                                          });
                                        },
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Alkalinity(pps)"),
                              Container(
                                child: Center(child: Text(_selectedId4 ?? "1")),
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 55,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Center(
                                      child: ColorSelectChip(
                                        // colorList2,
                                        colorList4,
                                        selectedColor: _selectedColor4 ??
                                            colorList4.first.toString(),
                                        onSelectionChanged:
                                            (String selectedList, String id) {
                                          setState(() {
                                            _selectedId4 = id;
                                            _selectedColor4 = selectedList;
                                            print(selectedList);
                                          });
                                        },
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

