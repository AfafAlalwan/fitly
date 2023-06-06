// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class OTPWidget extends StatelessWidget{
//   const OTPWidget(Key? key) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var otp;
//
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'tOtpSubTitle',
//               style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ),
//             Text(
//               'tOtpSubTitle'.toUpperCase(),
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//             const SizedBox(height: 40.0),
//             const Text("StOtpMessage support@codingwitht.com", textAlign: TextAlign.center),
//             const SizedBox(height: 20.0),
//               Text(
//               mainAxisAlignment: MainAxisAlignment.center,
//               numberofFields: 6,
//               fillColor: Colors.black.withOpacity(0.1),
//               filled: true,
//               onSubmit: (code) {
//                 otp = code;
//               },
//             ),
//             const SizedBox(height: 20.0),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add the button onPressed logic here
//                 },
//                 child: Text("Button Text"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }