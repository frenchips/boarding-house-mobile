// import 'package:ada_kost/bloc/bloc/sample_bloc.dart';
// import 'package:ada_kost/screen/training/training_screen_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocTrainingScreen extends StatefulWidget {
//   const BlocTrainingScreen({super.key});

//   @override
//   State<BlocTrainingScreen> createState() => _BlocTrainingScreenState();
// }

// class _BlocTrainingScreenState extends State<BlocTrainingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bloc Training'),
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => SampleBlocBloc(),
//           ),
//         ],
//         child: BlocTrainingScreenBody(),
//       ),
//     );
//   }
// }
