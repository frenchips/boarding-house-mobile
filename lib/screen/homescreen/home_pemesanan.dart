// import 'package:ada_kost/helper/locator.dart';
// import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_amt_person_response.dart';
import 'package:ada_kost/model/homeResponse/home_loaded_response.dart';
import 'package:ada_kost/model/homeResponse/home_payment_status_response.dart';
import 'package:ada_kost/screen/homescreen/home_data_diri.dart';
import 'package:ada_kost/screen/homescreen/home_pendataan.dart';
import 'package:ada_kost/state_management/blochome/bloc_home.dart';
import 'package:ada_kost/state_management/blochome/event_home.dart';
import 'package:ada_kost/state_management/blochome/state_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    Key? key,
    required this.setId, // tetap required
    required this.setPrice, // tidak required
  }) : super(key: key);

  final String setId;
  final int setPrice;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()..add(FetchParam()),
          ),
          // BlocProvider(
          //   create: (context) => HomeBloc()..add(FetchAmount()),
          // ),
        ],
        child: OrderScreenBody(
          id: setId,
          price: setPrice!,
        ));
  }
}

class OrderScreenBody extends StatefulWidget {
  OrderScreenBody({super.key, required this.id, required this.price});

  final String id;
  int price;

  @override
  State<OrderScreenBody> createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> {
  // String dropdownValue = list.first;

  HomeSaveOrderRequest reqOrder = HomeSaveOrderRequest();

  // int _itemCount = 0;


  Data? _selectedPay;
  // Amount? _selectedAmt;
  RoomLoad? roomLoad;

  TextEditingController _noRoomCo = TextEditingController();
  TextEditingController _priceCo = TextEditingController();
  TextEditingController _amtPersonCo = TextEditingController();
  TextEditingController _nameCo = TextEditingController();

  setUp() {
    _noRoomCo.text = widget.id;
    _priceCo.text = widget.price.toString();
  }

  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan'),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          // if(state is FetchPay){
          //   listPay = state.response.data!;
          // }
          // if(state is FetchRoomLoaded){
          //   roomLoad = state.response.data;
          // }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // if (state is FetchDataPayLoaded) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Nama Pemesanan'),
                    ),
                    TextFormField(
                      // enabled: false,
                      onChanged: (value) {
                        reqOrder.orderName = value;
                      },
                      controller: _nameCo,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Nomor Kamar'),
                    ),
                    TextFormField(
                      enabled: false,
                      onChanged: (value) {
                        reqOrder.roomNo = value;
                      },
                      controller: _noRoomCo,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Price'),
                    ),
                    TextFormField(
                      enabled: false,
                      controller: _priceCo,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Status Pembayaran'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is FetchDataParameterLoaded) {
                            return DropdownButton<Data>(
                              hint: Text('Pilih Pembayaran'),
                              value: _selectedPay,
                              isExpanded: true,
                              // selectedItemBuilder: ,
                              items: state.pay.map((Data data) {
                                return DropdownMenuItem<Data>(
                                    value: data,
                                    child: Text(data.description!));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPay = value;
                                  reqOrder.orderStatus =
                                      value!.description.toString();
                                });
                              },
                              underline: Container(
                                height: 1,
                                color: Colors.black, // Warna underline
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Jumlah Orang'),
                    ),
                    TextFormField(
                      // enabled: false,
                      onChanged: (value) {
                        // _updateItemCount();
                        reqOrder.totalOrder = int.parse(value);
                      },
                      controller: _amtPersonCo,
                    ),
                    // Container(
                    //     width: MediaQuery.of(context).size.width * 1,
                    //     child: BlocBuilder<HomeBloc, HomeState>(
                    //       builder: (context, state) {
                    //         if (state is FetchDataAmountLoaded) {
                    //           return DropdownButton<Amount>(
                    //             hint: Text('Pilih Jumlah Orang'),
                    //             value: _selectedAmt,
                    //             isExpanded: true,
                    //             // selectedItemBuilder: ,
                    //             items: state.amt.map((Amount data) {
                    //               return DropdownMenuItem<Amount>(
                    //                   value: data,
                    //                   child: Text(data.description!));
                    //             }).toList(),
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 _selectedAmt = value;
                    //               });
                    //             },
                    //             underline: Container(
                    //               height: 1,
                    //               color: Colors.black, // Warna underline
                    //             ),
                    //           );
                    //         }
                    //         return Container();
                    //       },
                    //     )
                    //     // }
                    //     // return Container();
                    //     //   },
                    //     // ),
                    //     ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF15B392)),
                        onPressed: () {
                          // locator<NavigatorService>().navigateTo('home_pendataan');
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Layout()));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PendataanScreen(
                                      reqModel: reqOrder,
                                      getNo: widget.id,
                                      // getPay: reqOrder.orderStatus!,
                                      // getAmt: reqOrder.totalOrder!,
                                      // fullname: '',
                                    )),
                          );

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DataDiriScreen(no: '', pay: '', amt: 1,)),
                          // );
                        },
                        child: const Text(
                          'Lanjutkan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            // }
            // return Container();
          },
        ),
      ),
    );
  }
}
