// import 'package:ada_kost/bloc/bloc/sample_bloc.dart';
// import 'package:ada_kost/bloc/event/sample_event.dart';
// import 'package:ada_kost/bloc/state/sample_state.dart';
// import 'package:ada_kost/screen/users/model/create_user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CreateUserScreen extends StatefulWidget {
//   const CreateUserScreen({super.key});

//   @override
//   State<CreateUserScreen> createState() => _CreateUserScreenState();
// }

// class _CreateUserScreenState extends State<CreateUserScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Api testing'),
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => SampleBlocBloc(),
//           ),
//         ],
//         child: CreateUserBody(),
//       ),
//     );
//   }
// }

// class CreateUserBody extends StatefulWidget {
//   const CreateUserBody({super.key});

//   @override
//   State<CreateUserBody> createState() => _CreateUserBodyState();
// }

// class _CreateUserBodyState extends State<CreateUserBody> {
//   CreateUserModel model = CreateUserModel();

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<SampleBlocBloc, SampleBlocState>(
//           listener: (context, state) {
//             if (state is CreateSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   duration: Duration(seconds: 5),
//                   content: Text(
//                     'SUCCESS',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//             } else if (state is SampleErrorState) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   duration: Duration(seconds: 5),
//                   content: Text(
//                     'FAILED',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             }
//           },
//         )
//       ],
//       child: BlocBuilder<SampleBlocBloc, SampleBlocState>(
//         builder: (context, state) {
//           if (state is CreateLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return Container(
//               padding: EdgeInsets.all(17),
//               child: Column(
//                 children: [
//                   Text('Create User'),
//                   TextFormField(
//                     decoration: InputDecoration(
//                         labelText: 'Name', hintText: 'Input Text'),
//                     onChanged: (value) {
//                       model.name = value;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                         labelText: 'Job', hintText: 'Input Text'),
//                     onChanged: (value) {
//                       model.name = value;
//                     },
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       BlocProvider.of<SampleBlocBloc>(context)
//                           .add(CreateUser(model));
//                     },
//                     child: Text(
//                       'Create',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
