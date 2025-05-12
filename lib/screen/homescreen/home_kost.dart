// import 'package:ada_kost/helper/locator.dart';
// import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_response.dart';
import 'package:ada_kost/screen/homescreen/home_pemesanan.dart';
import 'package:ada_kost/state_management/blochome/bloc_home.dart';
import 'package:ada_kost/state_management/blochome/event_home.dart';
import 'package:ada_kost/state_management/blochome/state_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocView extends StatelessWidget {
  HomeBlocView({super.key});

  HomeOrderRequest request = HomeOrderRequest();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(FetchHomeOrderData(request)),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ListData> listHome = [];
  List<HomeOrderResponse> modelList = [];
  HomeOrderResponse resp = HomeOrderResponse();
  HomeOrderRequest req = HomeOrderRequest();
  bool isLoadingMore = true;
  final _scrollController = ScrollController();

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (isLoadingMore) {
        isLoadingMore = false;
        BlocProvider(
            create: (context) => HomeBloc()..add(HomeOrderLoaded(req)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is FetchSearchHome) {
            resp = state.response;
            listHome.addAll(resp.listData!);
            print(resp);
            print(listHome);
            // setState(() {
            //   modelList = [];
            //   modelList.addAll(state.response);
            //   req.pageNo = 2;
            // });
          } 
          // // else if (state is SuccessLoadMore) {
          // //   setState(() {
          // //     if (state.respon.isNotEmpty) {
          // //       isLoadingMore = true;
          // //       modelList.addAll(state.respon);
          // //       req.pageNo = req.pageNo! + 1;
          // //     }
          // //   });
          // // }
          
        
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                // margin: EdgeInsets.only(right: 40, left: 40),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      // flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'search',
                          contentPadding: EdgeInsets.only(right: 10, bottom: 7),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      // controller: _scrollController,
                      itemCount: listHome.length,
                      // itemCount:
                      //     state is HomeLoadingMore || state is HomeLoading
                      //         ? modelList.length + 1
                      //         : modelList.length,
                      itemBuilder: (context, index) {
                        // if (index < modelList.length) {
                          return InkWell(
                            onTap: () {
                              listHome[index].roomStatus == 'NOT_EXIST'
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen(
                                                setId: listHome[index].roomNo!,
                                                setPrice:
                                                    listHome[index].price!,
                                              )))
                                  : Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Layout()));
                            },
                            child: itemRoom(
                                listHome[index].roomStatus!,
                                listHome[index].roomNo.toString(),
                                listHome[index].price!,
                                context
                                // listHome[index].price!,
                                // context,
                                // listRoom[index].inSelected!,
                                ),
                          );
                        }

                        // return state is RoomLoadingPage || state is RoomLoading
                        //     ? const Padding(
                        //         padding: EdgeInsets.symmetric(vertical: 8),
                        //         child: Center(child: CircularProgressIndicator()),
                        //       )
                        //     : const SizedBox();
                      // },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // child: SizedBox(
        //   // height: 500,
        //   child: Expanded(
        //     child: BlocBuilder<HomeBloc, HomeState>(
        //       builder: (context, state) {
        //         return ListView.builder(
        //           itemCount: listHome.length,
        //           itemBuilder: (context, index) {
        //             itemRoom(listHome[index].roomStatus!, listHome[index].roomNo!, listHome[index].price!.toInt(), context);
        //           },
        //         );
        //         // return ListView(

        //         //   children: [
        //         //     Material(
        //         //       child: InkWell(
        //         //         onTap: () {
        //         //           Navigator.pushReplacement(
        //         //             context,
        //         //             MaterialPageRoute(
        //         //                 builder: (context) => OrderScreen()),
        //         //           );
        //         //         },
        //         //         child: Container(
        //         //           decoration: BoxDecoration(
        //         //               border: Border.all(
        //         //                   width: 2, color: Color(0xFF15B392)),
        //         //               borderRadius:
        //         //                   BorderRadius.all(Radius.circular(20)),
        //         //               color: Color(0xFFFFFBE6)),
        //         //           padding: EdgeInsets.all(20),
        //         //           margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        //         //           // color: Color(0xFFFFFBE6),
        //         //           child: const Column(
        //         //             // mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         //             crossAxisAlignment: CrossAxisAlignment.start,
        //         //             children: [],
        //         //           ),
        //         //         ),
        //         //       ),
        //         //     ),
        //         //   ],
        //         // );
        //       },
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

Widget itemRoom(String status, String roomNo, int price, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 20),

    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF15B392)),
      color: Color(0xFFFFFBE6),
      borderRadius: BorderRadius.circular(20),
    ),
    width: MediaQuery.of(context).size.width,
    // width: 400,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: status == 'IS_EXIST'
                          ? Color(0xFF6CF460)
                          : Color(0xFFEBB7A6),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: status == 'IS_EXIST'
                      ? Visibility(visible: true, child: Text(''),)
                      : Text(
                          'Belum Terisi',
                          style: TextStyle(
                            color: Color(0xFFE65A3B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                Text(
                  roomNo,
                  style: TextStyle(
                      color: Color(0xFF15B392),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                Text('Rp.' + price.toString()),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
