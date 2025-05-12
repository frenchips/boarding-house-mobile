import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:ada_kost/state_management/blocroom/state_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDeleteBloc extends StatelessWidget {
  const RoomDeleteBloc({super.key, required this.request});

  // final String setNo;
  final RoomDeleteRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoomBloc>(
      create: (context) {
        return RoomBloc();
      },
      child: RoomScreenBodyDelete(getReq: request),
    );
  }
}

class RoomScreenBodyDelete extends StatefulWidget {
  const RoomScreenBodyDelete({super.key, required this.getReq});

  // final String setId;
  final RoomDeleteRequest getReq;

  @override
  State<RoomScreenBodyDelete> createState() => _RoomScreenBodyDeleteState();
}

class _RoomScreenBodyDeleteState extends State<RoomScreenBodyDelete> {
  RoomDeleteRequest req = RoomDeleteRequest();
  List<ListDelete> listReq = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is DeleteRoomSuccess) {
          Dialog(
            backgroundColor: Colors.white,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      child: Text('SUCCESS'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.check_circle,
                              size: 60,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is RoomLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Dialog(
              backgroundColor: Colors.white,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Text('Apakah ingin menghapus ?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<RoomBloc>(context).add(
                                     DeleteRoom(widget.getReq)
                                    );
                                    // locator<NavigatorService>().navigateReplaceTo('layout');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RoomScreenView()));
                                  },
                                  icon: Icon(
                                    Icons.check_circle_outline,
                                    size: 40,
                                    color: Colors.green[400],
                                  )),
                              IconButton(
                                  onPressed: () {
                                    locator<NavigatorService>().goBack();
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    size: 40,
                                    color: Colors.red[400],
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
