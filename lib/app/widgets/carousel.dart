// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CarouselCard extends StatefulWidget {
//   const CarouselCard({Key? key}) : super(key: key);

//   @override
//   State<CarouselCard> createState() => _CarouselCardState();
// }

// class _CarouselCardState extends State<CarouselCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height / 5,
//       width: Get.width,
//       decoration: const BoxDecoration(),
//       child: Builder(builder: (context) {
//         List images = [
//           "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
//           "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
//           "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
//           "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
//           "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
//         ];

//         return CarouselSlider(
//           options: CarouselOptions(
//             height: 400.0,
//             autoPlay: true,
//           ),
//           items: images.map((imageUrl) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.symmetric(horizontal: 6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         imageUrl,
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         );
//       }),
//     );
//   }
// }
