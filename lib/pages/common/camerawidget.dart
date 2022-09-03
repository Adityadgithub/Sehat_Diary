// import 'package:camera/camera.dart';
// import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/Add_P&R.dart';
// import 'package:flutter/material.dart';

// class CameraWidget extends StatefulWidget {
//   const CameraWidget({Key? key}) : super(key: key);

//   @override
//   State<CameraWidget> createState() => _CameraWidgetState();
// }

// bool opencam = false;

// bool flash = false;

// var controller;

// class _CameraWidgetState extends State<CameraWidget> {
//   @override
//   Widget build(BuildContext context) {
//     if (opencam == true) {
//       return SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height - 170,
//               width: MediaQuery.of(context).size.width,
//               child: CameraPreview(controller),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 35.0, left: 10, right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           presimagedone = null;
//                           repoimagedone = null;
//                         });
//                       },
//                       child: Text(
//                         "Cancel",
//                         style: TextStyle(color: Colors.white, fontSize: 15),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: TextButton(
//                         onPressed: () async {
//                           var result = await controller.takePicture();

//                           await AddPnRState().prescameraselectFile(result.path);
//                           presimagedone = 1;

//                           setState(() {
//                             Navigator.of(context).pop();
//                           });

//                           setState(() {});
//                         },
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.white),
//                                 shape: BoxShape.circle),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Icon(
//                                 Icons.camera,
//                                 size: 35,
//                               ),
//                             ))),
//                   ),
//                   if (flash == false)
//                     TextButton(
//                       onPressed: () {
//                         flash = true;
//                         controller.setFlashMode(FlashMode.always);
//                         setState(() {});
//                       },
//                       child: Icon(Icons.flashlight_off),
//                     ),
//                   if (flash == true)
//                     TextButton(
//                       onPressed: () {
//                         flash = false;

//                         controller.setFlashMode(FlashMode.off);
//                         setState(() {});
//                       },
//                       child: Icon(Icons.flashlight_on),
//                     )
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     }
//     if (opencam == false) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return SizedBox();
//   }
// }

// ////////////////////////////\

//         // List _cameras =
//         //                                                       await availableCameras();
//         //                                                   controller =
//         //                                                       CameraController(
//         //                                                           _cameras[0],
//         //                                                           ResolutionPreset
//         //                                                               .max);

//         //                                                   controller
//         //                                                       .initialize()
//         //                                                       .then((_) {
//         //                                                     if (!mounted) {
//         //                                                       return;
//         //                                                     }
//         //                                                     setState(() {});
//         //                                                   }).catchError(
//         //                                                           (Object e) {
//         //                                                     if (e
//         //                                                         is CameraException) {
//         //                                                       switch (e.code) {
//         //                                                         case 'CameraAccessDenied':
//         //                                                           print(
//         //                                                               'User denied camera access.');
//         //                                                           break;
//         //                                                         default:
//         //                                                           print(
//         //                                                               'Handle other errors.');
//         //                                                           break;
//         //                                                       }
//         //                                                     }
//         //                                                   });

//         //                                                   opencam = true;