// import 'package:ada_kost/bloc/event/sample_event.dart';
// import 'package:ada_kost/bloc/state/sample_state.dart';
// import 'package:ada_kost/screen/users/model/create_user.dart';
// import 'package:ada_kost/services/restapi.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';

// class SampleBlocBloc extends Bloc<SampleBlocEvent, SampleBlocState> {

//   // Restapi api = new Restapi();

//   // SampleBlocBloc() : super(SampleBlocInitial()){
//   //   on<SampleBlocEvent>((event, emit) async {
//   //     try{
//   //       if(event is IncrementCounterEvent){
//   //         int increment = event.count + 1;
//   //         emit(IncrementCounterState(increment));
//   //       } else if (event is DecrementCounterEvent){
//   //         int decrement = event.count - 1;
//   //         emit(DecrementCounterState(decrement));
//   //       } else if (event is CreateUser){
//   //         emit(CreateLoading());
//   //         String newId = await create(event.model);
//   //         emit(CreateSuccess(newId));
//   //       }
//   //     }catch(e){
//   //       emit(SampleErrorState());
//   //     }
//   //   });
//   // }

//   // Future<dynamic> create(CreateUserModel model) async{
//   //   var response = await api.login(body: model.toJson()) as Map<String, dynamic>;
//   //   model = CreateUserModel.fromJson(response);
//   //   return model;
//   // }
// }




