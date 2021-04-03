import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/category/bloc/bloc.dart';
import 'package:pagination/design_strip/page/design_steip_page.dart';
import 'package:pagination/category/model/category_response.dart';
import 'package:pagination/subcategory/page/sub_category.dart';
import 'package:pagination/category/services/repository.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // scaffold key
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  RepositoryCategory _repositoryProduct = RepositoryCategory();
  CategoryBloc productBloc;
  int page = 1;
  TabController _tabController;
  List<Category> _tabItemList = new List();


  @override
  void initState() {
    productBloc = CategoryBloc(_repositoryProduct);
    productBloc
        .add(CategoryButtonClickEvent("0", "Google", "Android", "", page));
    super.initState();
    _tabController =
        TabController(length: _tabItemList.length ?? null, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        cubit: productBloc,
        listener: (context, state) {
          if (state is CategoryLoading) {
            key.currentState
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Loading...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          } else if (state is CategoryError) {
            key.currentState
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(state.error)),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          } else if (state is CategoryDone) {
            print("${state.response.message}");

            _tabItemList = state.response.result.category;

            print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA${_tabItemList}");
            _tabController =
                TabController(length: _tabItemList.length, vsync: this);
          }
        },
        child: BlocBuilder(
          cubit: productBloc,
          builder: (context, state) {
            return Scaffold(
              key: key,
              resizeToAvoidBottomInset: false,


              appBar: AppBar(
                  backgroundColor: Colors.black,
                  actions: <Widget>[

                IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      //  Navigator.pop(context,true);
                    }),
              ]),
              body: SafeArea(child: FormUI()),

              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DesignStrip()));
                },
                child: const Icon(Icons.navigation),
                backgroundColor: Colors.green,
              ),
            );
          },
        ));
  }

  Widget FormUI() {
    return _tabItemList.length == null
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ))
        : Column(
            children: [
              Container(color:Colors.black,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                  child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey[600],
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(.3),
                        fontWeight: FontWeight.w700,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      tabs: _tabItemList
                          .map((listItem) => Text(
                                listItem.name,
                                style: TextStyle(fontSize: 18),
                              ))
                          .toList()),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: TabBarView(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: _tabItemList
                          .map((listItem) => SubDetails(id: listItem.id))
                          .toList()),
                ),
              ),
            ],
          );
  }
}
