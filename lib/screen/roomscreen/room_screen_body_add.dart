import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/model/roomrequest/room_model_add.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:ada_kost/state_management/blocroom/state_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomAddBloc extends StatelessWidget {
  const RoomAddBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoomBloc>(
      create: (context) => RoomBloc(),
      child: RoomScreenBodyAdd(),
    );
  }
}

class RoomScreenBodyAdd extends StatefulWidget {
  const RoomScreenBodyAdd({super.key});

  @override
  State<RoomScreenBodyAdd> createState() => _RoomScreenBodyAddState();
}

class _RoomScreenBodyAddState extends State<RoomScreenBodyAdd> {
  RoomModelRequest reqModel = RoomModelRequest();
  GlobalKey<FormState> keys = GlobalKey<FormState>();
  RoomBloc bloc = RoomBloc();
  
  TextEditingController _roomNo = TextEditingController();
  TextEditingController _price = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<RoomBloc>(context);
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is RoomAddSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                'SUCCESS',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is RoomError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                'FAILED',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          // if (state is RoomLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Add Kamar'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Nomor Kamar'),
                    ),
                    // TextField(),
                    TextFormField(
                      onChanged: (val) {
                        reqModel.roomNo = val;
                      },
                      controller: _roomNo,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Price'),
                    ),

                    TextFormField(
                      onChanged: (val) {
                        reqModel.price = val;
                      },
                      controller: _price,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF15B392)),
                        onPressed: () {
                          
                          bloc.add(CreateRoom(reqModel));
                          
                          // locator<NavigatorService>().navigateTo('home_pendataan');
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Layout()),
                          );
                        },
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          
        },
      ),
    );
  }
}
