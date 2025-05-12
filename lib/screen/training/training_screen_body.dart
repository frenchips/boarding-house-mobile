// import 'package:ada_kost/bloc/bloc/sample_bloc.dart';
// import 'package:ada_kost/bloc/event/sample_event.dart';
// import 'package:ada_kost/bloc/state/sample_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocTrainingScreenBody extends StatefulWidget {
//   const BlocTrainingScreenBody({super.key});

//   @override
//   State<BlocTrainingScreenBody> createState() => _BlocTrainingScreenBodyState();
// }

// class _BlocTrainingScreenBodyState extends State<BlocTrainingScreenBody> {
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SampleBlocBloc, SampleBlocState>(
//       listener: (context, state) {
//         if (state is IncrementCounterState) {
//           count = state.count;
//         } else if (state is DecrementCounterState) {
//           count = state.count;
//         }
//       },
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               'You have pushed the button this many times: ',
//             ),
//             BlocBuilder<SampleBlocBloc, SampleBlocState>(
//               builder: (context, state) {
//                 if (state is IncrementCounterState) {
//                   return Text(
//                     '$count',
//                     style: TextStyle(fontSize: 10),
//                   );
//                 } else if (state is DecrementCounterState) {
//                   return Text(
//                     '$count',
//                     style: TextStyle(fontSize: 10),
//                   );
//                 } else {
//                   return Text(
//                     '0',
//                     style: TextStyle(fontSize: 10),
//                   );
//                 }
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<SampleBlocBloc>(context)
//                             .add(IncrementCounterEvent(count));
//                       },
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     child: SizedBox(),
//                     flex: 1,
//                   ),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<SampleBlocBloc>(context)
//                             .add(DecrementCounterEvent(count));
//                       },
//                       child: Icon(
//                         Icons.remove,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
