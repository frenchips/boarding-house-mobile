// import 'package:ada_kost/componens/layout.dart';
// import 'package:ada_kost/helper/locator.dart';
// import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/model/homeRequest/home_order_request.dart';
// import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/screen/homescreen/home_data_diri.dart';
// import 'package:ada_kost/screen/homescreen/home_pemesanan.dart';
import 'package:ada_kost/state_management/blochome/bloc_home.dart';
import 'package:ada_kost/state_management/blochome/event_home.dart';
// import 'package:ada_kost/state_management/blochome/event_home.dart';
import 'package:ada_kost/state_management/blochome/state_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PendataanScreen extends StatelessWidget {
  const PendataanScreen({
    super.key,
    required this.getNo,
    // required this.getPay,
    // required this.getAmt,
    this.reqModel,
    // this.listModel
    // this.fullname
  });

  final HomeSaveOrderRequest? reqModel;
  // final ListPerson? listModel;
  final String getNo;
  // final String getPay;
  // final int getAmt;
  // final String? fullname;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: PendataanScreenBody(
        setNo: getNo,
        // setPay: getPay,
        // amount: getAmt,
        request: reqModel,
        // listModel: listModel,
        // name: fullname,
      ),
    );
  }
}

class PendataanScreenBody extends StatefulWidget {
  const PendataanScreenBody({
    super.key,
    this.request,
    // this.listModel,
    required this.setNo,
    // required this.setPay,
    // required this.amount,
    // this.name
  });

  // final ListPerson? listModel;
  final HomeSaveOrderRequest? request;
  final String setNo;
  // final String setPay;
  // final int amount;
  // final String? name;

  @override
  State<PendataanScreenBody> createState() => _PendataanScreenBodyState();
}

class _PendataanScreenBodyState extends State<PendataanScreenBody> {
  HomeSaveOrderRequest reqOrder = HomeSaveOrderRequest();
  ListPerson reqPerson = ListPerson();

  TextEditingController _noRoom = TextEditingController();
  TextEditingController _payRoom = TextEditingController();
  TextEditingController _itemCount = TextEditingController();
  TextEditingController _fullNameCo = TextEditingController();
  List<ListPerson> person = [];
  // int _pay() {
  //   int val = int.parse(widget.setPay.toString());
  //   return val;
  // }

  setUp() {
    reqOrder = widget.request!;
    // listPerson = reqOrder.listPerson!.toList();
    // if(listPerson.isNotEmpty){
    //   listPerson.add(widget.request.totalOrder);
    // }
    _noRoom.text = widget.setNo;
    _payRoom.text = widget.request?.orderStatus ?? '';
    _itemCount.text = widget.request?.totalOrder.toString() ?? "";
    // _itemCount.text = '2';
    // _fullNameCo.text = widget.name ?? "";
    // reqList.addAll(reqOrder.listPerson!.toList());
  }

  void initState() {
    super.initState();
    setUp();
    reqOrder.listPerson = [];
    // person.add(widget.listModel ?? reqPerson);
    // print('ini person ${person}');
    // reqOrder.listPerson?.add(widget.listModel!);
  }

  String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy', 'id').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SaveDetailPersonState) {
          reqOrder.listPerson!.add(state.listPersonState);
        } else if (state is SaveOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                'Success',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Isi Data',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              ),
              backgroundColor: const Color(0xFF15B392),
              // leading: IconButton(
              //   icon: Icon(Icons.arrow_back, color: Colors.white,),
              //   onPressed: () {
              //      Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(builder: (context) => OrderScreen(setId: widget.setNo, )),
              //         );
              //      // Aksi untuk kembali ke halaman sebelumnya
              //   },
              // ),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getFormattedDate(),
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        _noRoom.text,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      Text(_payRoom.text)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text(
                    'Detail Penghuni',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.grey[400],
                  child: Row(
                    children: [
                      Text('Jika tanda ('),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(') berwarna merah wajib diisi: ')
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    // itemCount: int.parse(_itemCount.text) == reqOrder.listPerson!.length ? reqOrder.listPerson!.length : 0,
                    itemCount: int.parse(_itemCount.text) >= 1 &&
                            int.parse(_itemCount.text) <= 2
                        ? int.parse(_itemCount.text)
                        // ? reqOrder.listPerson!.length
                        : 0,
                    // itemCount: reqOrder.listPerson!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        // color: Color(0xFFFFFBE6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Text(
                                //   reqOrder.listPerson![index].fullName!
                                //   // reqOrder.listPerson![index].fullName!.isNotEmpty ? reqOrder.listPerson![index].fullName! : 'Penghuni ${index + 1}'
                                //   // 'Testing'
                                //   // widget.listModel?.fullName ?? '-',
                                //   // reqPerson.fullName!.isNotEmpty
                                //   //     ?  reqOrder.listPerson![index].fullName!
                                //   //     // _fullNameCo.text
                                //   //     : 'Penghuni ${index + 1}'
                                //   // widget.
                                // ),

                                Text(
                                  (reqOrder.listPerson != null &&
                                          index < reqOrder.listPerson!.length &&
                                          reqOrder.listPerson!.isNotEmpty)
                                      ? reqOrder.listPerson![index].fullName!
                                      : 'Penghuni ${index + 1}',
                                ),

                                Text(
                                  '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // Dialog menampilkan dari bawah
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return DataDiriScreen(no: widget.setNo);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                ).then((value) =>
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(SaveDetailPerson(value)));

                                // Dialog biasa
                                // showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return AlertDialog(
                                //         content: DataDiriScreen(
                                //                 no: widget.setNo),
                                //       );
                                //     },);

                                // Sebelumnya
                                //   Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DataDiriScreen(
                                //               no: widget.setNo,
                                //               // pay: widget.setPay,
                                //               modelDetail: null,
                                //               modelRequest: reqOrder,
                                //               // amt: widget.amount,
                                //               // name: widget.name,
                                //             )),
                                //   );
                              },
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF15B392)),
                    onPressed: () {
                      // locator<NavigatorService>().navigateTo('layout');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Layout()),
                      );
                      BlocProvider.of<HomeBloc>(context)..add(SaveOrder(widget.setNo, reqOrder));

                      // BlocProvider.of<HomeBloc>(context)..add(SaveOrder(widget.request!.roomNo.toString(), reqOrder));
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
