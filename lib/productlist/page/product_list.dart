import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class ProductList extends StatefulWidget {
  final int id;

  ProductList({this.id});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductList> with TickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  int page = 1;
  bool isLoading = false;
  List tempList = new List();
  List _poductList = new List();
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

  var a;
  getData() async {

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      Dio dio = Dio();
      Response response = await dio.post('http://esptiles.imperoserver.in/api/API/Product/ProductList',
        data: {"SubCategoryId": widget.id, "PageIndex": page},
      );


      for (int i = 0; i < response.data["Result"].length; i++) {
        tempList.add(response.data["Result"][i]);
      }
      setState(() {
        isLoading = false;
     _poductList.addAll(tempList);
        page=page+1;

      });

    }}


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 8,left: 8),
      itemCount: _poductList.length+1,
      itemBuilder: (BuildContext context, int index) {

        if (index == _poductList.length) {
            return _buildProgressIndicator();
        }
        return
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [


              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                      image: NetworkImage(
                          _poductList[index]["ImageName"]),
                      fit: BoxFit.fill,
                    )),
              ),
              Positioned(top: 7,left: 10,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[300],

                        borderRadius: BorderRadius.all(Radius.circular(7))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text( _poductList[index]["PriceCode"]),
                    )
                ),
              ),
            ],
          ),
        );
      },
    );

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
