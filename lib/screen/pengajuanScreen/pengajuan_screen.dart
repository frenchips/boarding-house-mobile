import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PengajuanScreen extends StatelessWidget {
  const PengajuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child: PengajuanBody());
  }
}

class PengajuanBody extends StatefulWidget {
  const PengajuanBody({super.key});

  @override
  State<PengajuanBody> createState() => _PengajuanBodyState();
}

class _PengajuanBodyState extends State<PengajuanBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
                alignment: Alignment.center,
                child: Text(
                  'PENGAJUAN SEWA',
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
              backgroundColor: Color(0xFF15B392),
      ),
      body: Padding(
         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
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
            // Expanded(
            //   flex: 1,
            //   child: BlocBuilder<HomeBloc, HomeState>(
            //     builder: (context, state) {
            //       return ListView.builder(
            //         controller: _scrollController,
            //         // itemCount: listHome.length,
            //         itemCount:
            //             state is HomeLoadingMore || state is HomeLoading
            //                 ? modelList.length + 1
            //                 : modelList.length,
            //         itemBuilder: (context, index) {
            //           if (index < modelList.length) {
            //             return InkWell(
            //               onTap: () {
            //                 listHome[index].roomStatus == 'NOT_EXIST'
            //                     ? Navigator.pushReplacement(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => OrderScreen(
            //                                   setId: listHome[index].roomNo!,
            //                                   setPrice:
            //                                       listHome[index].price!,
            //                                 )))
            //                     : Navigator.pushReplacement(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => Layout()));
            //               },
            //               child: itemRoom(
            //                   listHome[index].roomStatus!,
            //                   listHome[index].roomNo.toString(),
            //                   listHome[index].price!,
            //                   context
            //                   // listHome[index].price!,
            //                   // context,
            //                   // listRoom[index].inSelected!,
            //                   ),
            //             );
            //           }
        
            //           // return state is RoomLoadingPage || state is RoomLoading
            //           //     ? const Padding(
            //           //         padding: EdgeInsets.symmetric(vertical: 8),
            //           //         child: Center(child: CircularProgressIndicator()),
            //           //       )
            //           //     : const SizedBox();
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
