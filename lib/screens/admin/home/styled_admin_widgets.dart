import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/shared_text.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer(this.text, this.onPressed, {super.key});
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: SizedBox(
          width: 125,
          height: 125,
          child: Center(child: TitleText(text)),
        ),
      ),
    );
  }
}

// class CustomAdminContainer extends StatelessWidget {
//   const CustomAdminContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DateTime time = DateTime.now();
//     return Card(
//       child: SizedBox(
//         width: double.infinity,
//         height: 130,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   TitleText("Students"),
//                   Expanded(child: SizedBox()),
//                   TitleText("Team")
//                 ],
//               ),
//               const Expanded(child: SizedBox()),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       TitleText(DateFormat("dd-MM-yyyy").format(time)),
//                     ],
//                   )
//                 ],
//               ),
//               const Expanded(child: SizedBox()),
//               const Row(
//                 children: [
//                   BodyText("40/69"),
//                   Expanded(child: SizedBox()),
//                   BodyText("7/19")
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
