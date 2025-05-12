import 'package:ada_kost/componens/bottom_bar_room%20copy.dart';
import 'package:ada_kost/model/parameterRequest/parameter_request.dart';
import 'package:ada_kost/model/parameterResponse/parameter_response.dart';
import 'package:ada_kost/state_management/blocparameter/bloc_parameter.dart';
import 'package:ada_kost/state_management/blocparameter/event_parameter.dart';
import 'package:ada_kost/state_management/blocparameter/state_parameter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParameterScreen extends StatelessWidget {
  ParameterScreen({super.key});

  ParameterSearchRequest request = ParameterSearchRequest();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParameterBloc()
        ..add(FetchParameterData(ParameterSearchRequest.intial())),
      child: ParameterBody(),
    );
  }
}

class ParameterBody extends StatefulWidget {
  const ParameterBody({super.key});

  @override
  State<ParameterBody> createState() => _ParameterBodyState();
}

class _ParameterBodyState extends State<ParameterBody> {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  List<ListData> listParameter = [];

  ParameterSearchResponse response = ParameterSearchResponse();
  ParameterSearchRequest request = ParameterSearchRequest.intial();

  TextEditingController searchController = TextEditingController();

  bool isLoadingMore = true;
  bool noMoreData = false;
  final _scrollController = ScrollController();

  String? value;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: value);
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (isLoadingMore) {
        isLoadingMore = false;
        BlocProvider.of<ParameterBloc>(context)
            .add(FetchParameterLoaded(request));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ParameterBloc, ParameterState>(
      listener: (context, state) {
        if (state is FetchSuccess) {
          // listParameter = [];
          // listParameter.addAll(state.response.listData!);
          listParameter = state.response.listData! ?? [];
          // request.pageNo = 2;
        } else if (state is FetchSuccessLoadMore) {
          // if (state.response.listData!.isNotEmpty) {
          //   isLoadingMore = true;
          //   listParameter.addAll(state.response.listData!);
          //   request.pageNo = request.pageNo! + 1;
          // }

          listParameter.addAll(state.response.listData! ?? []);
        }
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('PARAMETER'),
          backgroundColor: const Color(0xFF15B392),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Color(0xFF15B392),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text('Total data : ${listParameter.length}'),
            Expanded(
              flex: 1,
              child: BlocBuilder<ParameterBloc, ParameterState>(
                builder: (context, state) {
  
                  return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      itemCount: state is FetchParameterLoadMore ||
                              state is ParameterLoading
                          ? listParameter.length + 1
                          : listParameter.length,
                      itemBuilder: (context, index) {
                        if (index < listParameter.length) {
                          return itemParameter(context,listParameter[index].paramTypeName!, listParameter[index].detailName!);
                        }
                        return state is FetchParameterLoadMore || state is ParameterLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : const SizedBox();
                      });
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBarParameter(),
      ),
    );
  }

  Widget itemParameter(
      BuildContext context, String paramName, String detailName) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF15B392)),
        color: Color(0xFFFFFBE6),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(paramName), Text(detailName)],
      ),
    );
  }
}
