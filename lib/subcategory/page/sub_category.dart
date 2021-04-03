import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pagination/productlist/page/product_list.dart';

class SubDetails extends StatefulWidget {
  final int id;

  SubDetails({this.id});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SubDetails> with TickerProviderStateMixin {

  int page = 1;

  ScrollController _scrollController = new ScrollController();
  List _subCategory = new List();
  bool isLoading = false;
  List tempList = new List();
  @override
  void initState() {

    this.getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getData();
      }
    });
    super.initState();

  }




  getData() async {

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

    Dio dio = Dio();
    Response response = await dio.post('http://esptiles.imperoserver.in/api/API/Product/DashBoard',
      data: {"CategoryId":widget.id, "PageIndex": page},
    );




      for (int i = 0; i < response.data["Result"]["Category"][0]["SubCategories"].length; i++) {
        tempList.add(response.data["Result"]["Category"][0]["SubCategories"][i]);
      }
    setState(() {
      isLoading = false;
      _subCategory.addAll(tempList);
      page=page+1;

    });


  }}

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(8),
        itemCount: _subCategory.length+1,
        itemBuilder: (BuildContext context, int index) {

          if (index == _subCategory.length) {
            if(tempList==null){return Container();}
            else
            return _buildProgressIndicator();
          } else
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_subCategory[index]["Name"]),
                Container(
                    height: 150,
                    child: ProductList(id: _subCategory[index]["Id"]))
              ],
            );
        });





  }

    Widget _buildProgressIndicator() {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new Opacity(
            opacity: isLoading ? 1.0 : 00,
            child: new CircularProgressIndicator(),
          ),
        ),
      );
    }
}
