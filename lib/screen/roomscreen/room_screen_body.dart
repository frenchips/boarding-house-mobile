import 'package:ada_kost/componens/bottom_bar.dart';
import 'package:ada_kost/componens/bottom_bar_room.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';
import 'package:ada_kost/model/roomresponse/room_response_search.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body_delete.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:ada_kost/state_management/blocroom/state_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomScreenView extends StatelessWidget {
  RoomScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    RoomSearchRequest req = RoomSearchRequest.initial();
    // RoomDeleteRequest reqDelete = RoomDeleteRequest();
    return Scaffold(
      appBar: AppBar(
        title: Text('KAMAR'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RoomBloc()..add(FetchRoomData(req)),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: RoomScreenBodyView(),
      ),
      // bottomNavigationBar: BottomBarRoom(),
    );
  }
}

class RoomScreenBodyView extends StatefulWidget {
  const RoomScreenBodyView({super.key});

  @override
  State<RoomScreenBodyView> createState() => _RoomScreenBodyViewState();
}

class _RoomScreenBodyViewState extends State<RoomScreenBodyView> {
  List<ListData> listRoom = [];
  List<ListData> selectRoom = [];

  List<ListDelete> selectDelete = [];
  List<ListDelete> listDelete = [];
  List<String> selectIndex = [];

  // RoomSearchRequest req = RoomSearchRequest();
  RoomSearchRequest request = RoomSearchRequest.initial();
  RoomSearchResponse resp = RoomSearchResponse();

  RoomDeleteRequest delReq = RoomDeleteRequest();

  bool isLoadPage = true;
  bool _hashMore = true;
  final ScrollController _scrollCo = ScrollController();

  String inNo = '';

  void deleteItem(int index) {
    setState(() {
      selectIndex.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is ViewSuccessRoom) {
          // if(state.response.listData!.isNotEmpty){
          resp = state.response;
          listRoom.addAll(resp.listData!);
          // request.pageNo = 2;
          // }
          print(request.pageNo!);
          print(resp);
        } else if (state is FetchSuccessLoadMore) {
          isLoadPage = true;
          listRoom.addAll(state.listResponse);
          request.pageNo = request.pageNo! + 1;
        } else if (state is DeleteRoomSuccess) {
          
        }
        // if (state is FetchSuccess) {
        //   listRoom = [];
        //   listRoom.addAll(state.listResponse);
        //   req.pageNo = 2;
        // } else if (state is FetchSuccessLoadMore) {
        //   isLoadPage = true;
        //   listRoom.addAll(state.listResponse);
        //   req.pageNo = req.pageNo! + 1;
        // }
        // else if(state is ViewSuccessRoomLoadPage) {
        //   if(state.response.isNotEmpty){
        //     isLoadPage = true;
        //     listRoom.addAll(state.response);
        //     req.pageNo = req.pageNo! + 1;
        //   }
        // }
      },
      child: Container(
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
              child: BlocBuilder<RoomBloc, RoomState>(
                builder: (context, state) {
                  return ListView.builder(
                    controller: _scrollCo,
                    itemCount: listRoom.length,
                    // itemCount: state is RoomLoadingPage || state is RoomLoading
                    //     ? listRoom.length + 1
                    //     : listRoom.length,
                    itemBuilder: (context, index) {
                      // if (index < listRoom.length) {
                      return InkWell(
                        onTap: () {
                          // Navigator.pop(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => RoomDeleteBloc(
                          //                   setNo: listRoom[index].roomNo!,
                          //                 )));
                          // showDialog(context: context, builder: (context) => RoomDeleteBloc(setNo: listRoom[index].roomNo!), );
                          setState(
                            () {
                              // listRoom[index].inSelected =
                              //     !listRoom[index].inSelected!;
                              // if (listRoom[index].inSelected ==
                              //     true) {
                              //   selectRoom.removeWhere((element) =>
                              //       element.roomNo ==
                              //       listRoom[index].roomNo);
                              // }

                              // inNo = listRoom[index].roomNo.toString();
                              // inName = listSettingGroup[index].settingGroupName.toString();
                              // inDesc = listSettingGroup[index].settingGroupDescription.toString();

                              // print(inCode);

                              listRoom[index].inSelected =
                                  !listRoom[index].inSelected!;

                              if (listRoom[index].inSelected!) {
                                selectRoom.add(listRoom[index]);
                              } else {
                                selectRoom.removeWhere((room) =>
                                    room.roomNo == listRoom[index].roomNo);
                              }

                              delReq.listDelete = selectRoom.map((room) => ListDelete(no: room.roomNo)).toList();
                            
                            },
                          );
                        },
                        child: itemRoom(
                            listRoom[index].roomNo.toString(),
                            listRoom[index].price!,
                            context,
                            listRoom[index].inSelected!),
                      );
                      // }

                      // return state is RoomLoadingPage || state is RoomLoading
                      //     ? const Padding(
                      //         padding: EdgeInsets.symmetric(vertical: 8),
                      //         child: Center(child: CircularProgressIndicator()),
                      //       )
                      //     : const SizedBox();
                    },
                  );
                },
              ),
            ),
            BottomBarRoom(
              getRequest: delReq,
            )
          ],
        ),
      ),
      // return Scaffold(body: listDataRoom(listRoom, context));
      // },
      // ),
    );
  }
}

Widget itemRoom(String roomNo, int price, BuildContext context, bool isCek) {
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
  );
}
