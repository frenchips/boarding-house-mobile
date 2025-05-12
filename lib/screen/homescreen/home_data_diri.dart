import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeResponse/home_payment_status_response.dart';
import 'package:ada_kost/screen/homescreen/home_pendataan.dart';
import 'package:ada_kost/state_management/blochome/bloc_home.dart';
import 'package:ada_kost/state_management/blochome/event_home.dart';
import 'package:ada_kost/state_management/blochome/state_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataDiriScreen extends StatelessWidget {
  DataDiriScreen({
    super.key,
    required this.no,
    // this.name,
    this.modelDetail,
    this.modelRequest,
  });

  final String no;
  // final String? name;
  final ListPerson? modelDetail;
  final HomeSaveOrderRequest? modelRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchGender()),
      child: DataDiriScreenBody(
        no: no,
        // fullName: name,
        modelDetail: modelDetail,
        modelRequest: modelRequest,
      ),
    );
  }
}

class DataDiriScreenBody extends StatefulWidget {
  const DataDiriScreenBody({
    super.key,
    required this.no,
    this.pay,
    this.amt,
    this.modelDetail,
    this.modelRequest,
    // this.fullName,
  });

  final String no;
  final String? pay;
  final int? amt;
  final ListPerson? modelDetail;
  final HomeSaveOrderRequest? modelRequest;
  // final String? fullName;

  @override
  State<DataDiriScreenBody> createState() => _DataDiriScreenBodyState();
}

class _DataDiriScreenBodyState extends State<DataDiriScreenBody> {
  TextEditingController _fullNameCo = TextEditingController();
  TextEditingController _nikCo = TextEditingController();
  TextEditingController _genderCo = TextEditingController();

  ListPerson modelDetail = ListPerson();

  int _selectedValue = 0;
  Data? _selectedGender;

  void _onRadioChanged(int value) {
    setState(() {
      _selectedValue = value.toInt();
    });
  }

  // setUp() {
  //   _fullNameCo.text = modelDetail.fullName ?? "";
  //   _nikCo.text = modelDetail.nik.toString() ?? "";
  //   _genderCo.text = modelDetail.gender ?? "";
  // }

  void resetDetail() {
    setState(() {
      modelDetail = ListPerson();
      _fullNameCo.text = modelDetail.fullName ?? "";
      _nikCo.text = modelDetail.nik.toString();
      _genderCo.text = modelDetail.gender ?? "";
    });
  }

  void initState() {
    super.initState();
    // setUp();
    if (widget.modelDetail != null) {
      modelDetail = widget.modelDetail!;

      _fullNameCo.text = modelDetail.fullName ?? "";
      _nikCo.text = modelDetail.nik.toString();
      _genderCo.text = modelDetail.gender ?? "";
    }
  }

  // ListPerson reqList = ListPerson();
  HomeSaveOrderRequest req = HomeSaveOrderRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Detail Penghuni',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.cancel),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Nama Lengkap'),
              ),
              TextFormField(
                // enabled: false,
                onChanged: (value) {
                  modelDetail.fullName = value;
                },
                controller: _fullNameCo,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('NIK'),
              ),
              TextFormField(
                // enabled: false,
                onChanged: (value) {
                  modelDetail.nik = int.parse(value);
                },
                controller: _nikCo,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('Gender'),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is FetchDataParameterLoaded) {
                      return DropdownButton<Data>(
                        hint: Text('Pilih'),
                        value: _selectedGender,
                        isExpanded: true,
                        // selectedItemBuilder: ,
                        items: state.pay.map((Data data) {
                          return DropdownMenuItem<Data>(
                              value: data, child: Text(data.description!));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            modelDetail.gender = value!.description.toString();
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
              // Row(
              //   children: [
              //     Radio(
              //       value: 1,
              //       groupValue: _selectedValue,
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedValue = value!;
              //           reqList.gender = value.toString();
              //         });
              //       },
              //     ),
              //     Text('Laki-Laki'),
              //     Radio(
              //       value: 2,
              //       groupValue: _selectedValue,
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedValue = value!;
              //           reqList.gender = value.toString();
              //         });
              //       }
              //     ),
              //     Text('Perempuan'),
              //   ],
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15B392)),
                  onPressed: () {
                    // locator<NavigatorService>().navigateTo('home_pendataan');
                    Navigator.pop(context, modelDetail);
                    // Navigator.pop(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) {
                    //         final req = ListPerson(fullName: _fullNameCo.text);
                    //          return PendataanScreen(
                    //             listModel: req,
                    //             getNo: widget.no,
        
                    //             // getPay: widget.pay,
                    //             // getAmt: widget.amt!,
                    //             // fullname: reqList.fullName,
                    //           );
                    //       }
                    //       ),
                    // );
                    // Navigator.pushReplacement(
                    //   context, modelDetail
                    //   // MaterialPageRoute(
                    //   //   builder: (context) => PendataanScreen(
                    //   //     reqModel: req,
                    //   //     getNo: widget.no,
                    //   //     // getPay: widget.pay,
                    //   //     // getAmt: widget.amt!,
                    //   //     // fullname: modelDetail.fullName,
                    //   //   ),
                    //   // ),
                    // );
        
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
      ),
    );
  }
}
