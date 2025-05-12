import 'package:ada_kost/componens/bottom_bar_room.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';
import 'package:ada_kost/model/roomresponse/room_response_search.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:ada_kost/state_management/blocroom/state_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // RoomSearchRequest req = RoomSearchRequest.initial();

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RoomBloc()..add(FetchRoomData(RoomSearchRequest())),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: RoomScreenBody(),
      ),
    );

    // return BlocProvider<RoomBloc>(
    //     create: (context) => RoomBloc()..add(ViewRoomData(req)),
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('ROOM'),
    //       ),
    //       body: RoomScreenBody(),
    //       bottomNavigationBar: BottomBarRoom(),
    //     ));
  }
}

class RoomScreenBody extends StatefulWidget {
  const RoomScreenBody({super.key});

  @override
  State<RoomScreenBody> createState() => _RoomScreenBodyState();
}

class _RoomScreenBodyState extends State<RoomScreenBody> {
  //
  RoomSearchRequest req = RoomSearchRequest();
  RoomSearchResponse resp = RoomSearchResponse();
  RoomDeleteRequest reqDel = RoomDeleteRequest();

  // list
  List<ListData> listRoom = [];
  List<ListData> selectRoom = [];
  List<String> selectIndex = [];

  // Controller
  late TextEditingController searchControl = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _val = TextEditingController();

  bool isTap = false;
  bool _isLoading = false;

  String inNo = '';
  String inPrice = '';

  bool _hasMore = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchData();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //             _scrollController.position.maxScrollExtent &&
  //         !_isLoading &&
  //         _hasMore) {
  //       _fetchData();
  //     }
  //   });
  // }

  // Future<void> _fetchData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     setState(() {
  //       listRoom.addAll(resp.listData!);
  //       _hasMore = resp.listData!.length == resp.pageSize;
  //       int _pageNo = resp.pageNo!.toInt();
  //       _pageNo++;
  //     });
  //   } catch (e) {
  //     print('Failed to load items: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is ViewSuccessRoom) {
          resp = state.response;
          listRoom.addAll(resp.listData!);
          print(resp);
        }
      },
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          // if (state is RoomLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else
          // return Scaffold(
          //   body: SizedBox(
          //     // height: 500,
          //     child: Column(
          //       children: [
          //         Container(
          //           color: Colors.white,
          //           height: 40,
          //           margin: const EdgeInsets.symmetric(
          //               horizontal: 30, vertical: 20),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               const Expanded(
          //                 flex: 2,
          //                 child: Icon(Icons.search),
          //               ),
          //               Expanded(
          //                 flex: 7,
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     // border: Border.all(color: Colors.grey),
          //                     borderRadius: BorderRadius.circular(10.0),
          //                   ),
          //                   child: TextField(
          //                     decoration: const InputDecoration(
          //                       hintText: 'Search',
          //                       hintStyle: TextStyle(color: Colors.grey),
          //                       contentPadding:
          //                           EdgeInsets.only(right: 10, bottom: 7),
          //                       border: InputBorder.none,
          //                     ),
          //                     onTap: () {
          //                       // setState(() {
          //                       //   isTap = true;
          //                       // });
          //                     },
          //                     controller: searchControl,
          //                     onChanged: (value) {
          //                       // setState(() {
          //                       //   listSettingGroup = listSettingGroup
          //                       //       .where((element) => element
          //                       //           .settingGroupName!
          //                       //           .toLowerCase()
          //                       //           .contains(searchControl.text))
          //                       //       .toList();
          //                       // });
          //                       // SettingGroupBody();
          //                     },
          //                     // onChanged: (value) {
          //                     //   // BlocProvider.of<SettingGroupSearchBloc>(context)
          //                     //   //     .add(ViewData(request));

          //                     // },
          //                   ),
          //                 ),
          //               ),
          //               Visibility(
          //                 // visible: isTap,
          //                 child: Expanded(
          //                   flex: 3,
          //                   child: IconButton(
          //                     icon: const Icon(
          //                       Icons.list,
          //                       color: Colors.black,
          //                     ),
          //                     onPressed: () {
          //                       // showDialog(
          //                       //   context: context,
          //                       //   builder: (context) {
          //                       //     return OpenDialog();
          //                       //   },
          //                       // );
          //                       // setState(() {
          //                       //   this.isSearch = !this.isSearch;
          //                       // }
          //                       // );
          //                     },
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: 400,
          //           child: Expanded(
          //             child: ListView.builder(
          //               itemCount: listRoom.length,
          //               itemBuilder: (context, index) {
          //                 return InkWell(
          //                   onTap: () {},
          //                   child: itemRoom(listRoom[index].roomNo.toString(), listRoom[index].price!),
          //                 );
          //               },
          //               // children: [
          //               //   Material(
          //               //     child: InkWell(
          //               //       onTap: () {
          //               //         // Navigator.pushReplacement(
          //               //         //   context,
          //               //         //   MaterialPageRoute(builder: (context) => OrderScreen()),
          //               //         // );
          //               //       },
          //               //       child: Container(
          //               //         padding: EdgeInsets.all(20),
          //               //         margin: EdgeInsets.only(top: 20),
          //               //         color: Color(0xFFFFFBE6),
          //               //         child: const Column(
          //               //           // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               //           crossAxisAlignment: CrossAxisAlignment.start,
          //               //           children: [
          //               //             Text(
          //               //               'A001',
          //               //               style: TextStyle(
          //               //                   fontWeight: FontWeight.bold),
          //               //             ),
          //               //             Divider(
          //               //               color: Colors.black, // Warna garis
          //               //               // thickness: 2, // Ketebalan garis
          //               //               // indent: 20, // Jarak dari tepi kiri
          //               //               // endIndent: 20, // Jarak dari tepi kanan
          //               //             ),
          //               //             Text(
          //               //               'Harga',
          //               //               style: TextStyle(
          //               //                   fontWeight: FontWeight.bold),
          //               //             ),
          //               //             Text(
          //               //               'Rp.600.000',
          //               //               style: TextStyle(
          //               //                   fontWeight: FontWeight.bold),
          //               //             ),
          //               //           ],
          //               //         ),
          //               //       ),
          //               //     ),
          //               //   ),
          //               // ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
          if (state is RoomLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
            // listRoom.addAll(resp.listData!);
            // _hasMore = resp.listData!.length == resp.pageSize;
            // resp.pageNo!.toInt() + 1;

          } else {
              return Scaffold(
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.center,
                child: Text(
                  'ROOM',
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
              backgroundColor: Color(0xFF15B392),
            ),

            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white12,
            // bottomNavigationBar: BottomBarRoom(
            //   getId: inNo,
            // ),
            

            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF15B392)),
                    color: Color(0xFFFFFBE6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // color: Colors.white,
                  height: 30,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.only(right: 10, bottom: 7),
                              border: InputBorder.none,
                            ),
                            onTap: () {
                              setState(() {
                                isTap = true;
                              });
                            },
                            controller: searchControl,
                            onChanged: (value) {
                              setState(() {
                                listRoom = listRoom
                                    .where((element) => element.roomNo!
                                        .toLowerCase()
                                        .contains(searchControl.text))
                                    .toList();
                              });
                              // SettingGroupBody();
                            },
                            // onChanged: (value) {
                            //   // BlocProvider.of<SettingGroupSearchBloc>(context)
                            //   //     .add(ViewData(request));

                            // },
                          ),
                        ),
                      ),
                      // Visibility(
                      //   // visible: isTap,
                      //   child: Expanded(
                      //     flex: 3,
                      //     child: IconButton(
                      //       icon: const Icon(
                      //         Icons.cancel,
                      //         color: Colors.black,
                      //       ),
                      //       onPressed: () {
                      //         // showDialog(
                      //         //   context: context,
                      //         //   builder: (context) {
                      //         //     // return OpenDialog();
                      //         //   },
                      //         // );
                      //         // setState(() {
                      //         //   this.isSearch = !this.isSearch;
                      //         // });
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // listDataRoom(listRoom, context)
                SizedBox(
                  height: 560,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: listRoom.length ,
                    itemBuilder: (context, index) {
                      if (index == listRoom.length) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return InkWell(
                        onTap: () {
                          // reqDel.listDelete!.map((e) => e.no);
                          setState(
                            () {
                              listRoom[index].inSelected =
                                  !listRoom[index].inSelected!;
                              if (listRoom[index].inSelected == true) {
                                selectRoom.removeWhere((element) =>
                                    element.roomNo == listRoom[index].roomNo);
                              }

                              inNo = listRoom[index].roomNo.toString();
                              inPrice = listRoom[index].price.toString();
                              
                            
                              print(inNo);
                            },
                          );
                        },
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Expanded(
                            flex: 1,
                            child: itemRoom(
                                listRoom[index].roomNo.toString(),
                                listRoom[index].price!,
                                context,
                                listRoom[index].inSelected!),
                          ),
                        ),
                        // child: Container(
                        //   height: 160,
                        //   margin: const EdgeInsets.symmetric(
                        //       horizontal: 30, vertical: 5),
                        //   child: itemRoom(
                        //     listRoom[index]
                        //         .roomNo
                        //         .toString(),
                        //     listRoom[index]
                        //         .price!

                        //   ),
                        // ),
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
                // if (_isLoading) CircularProgressIndicator()
              ],
            ),
           
            // bottomNavigationBar: Bar(inCode, inName, inDesc),
          );
          }
          
        },
      ),
    );
  }
}


Widget listDataRoom(List<ListData> listRoom, BuildContext context) {
  return Scaffold(
    body: SizedBox(
      height: 560,
      child: ListView.builder(
        itemCount: listRoom.length,
        itemBuilder: (context, index) {
          itemRoom(listRoom[index].roomNo.toString(), listRoom[index].price!,
              context, listRoom[index].inSelected!);
        },
      ),
    ),
  );
}

Widget itemRoom(String roomNo, int price, BuildContext context, bool isCek) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF15B392)),
        color: Color(0xFFFFFBE6),
        borderRadius: BorderRadius.circular(20),
      ),
      // height: 160,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      // margin: const EdgeInsets.only(top: 10),
      // color: const Color(0xFFFFFBE6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                roomNo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp.' + price.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            child: Visibility(
              visible: isCek,
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.green[700],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
