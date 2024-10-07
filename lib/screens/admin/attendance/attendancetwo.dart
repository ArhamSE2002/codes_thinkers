// import 'package:flutter/material.dart';



// class EmployeeTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columns: [
//           DataColumn(label: Text('ID')),
//           DataColumn(label: Text('Employee')),
//           DataColumn(label: Text('Action')),
//         ],
//         rows: [
//           DataRow(cells: [
//             DataCell(Text('21918')),
//             DataCell(Text('Anugrah Prasetya')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Approve'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('37189')),
//             DataCell(Text('Denny Malik')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Reject'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('41521')),
//             DataCell(Text('Silvia Cintia Bakri')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Approve'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('12781')),
//             DataCell(Text('Bambang Pramudi')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Approve'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('81721')),
//             DataCell(Text('Joseph Stewart')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Approve'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('09172')),
//             DataCell(Text('Putri Candra Alexa')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Approve'))),
//           ]),
//           DataRow(cells: [
//             DataCell(Text('19221')),
//             DataCell(Text('Drake Jefri')),
//             DataCell(ElevatedButton(onPressed: () {}, child: Text('Reject'))),
//           ]),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class feeScreen extends StatefulWidget {
  const feeScreen({super.key});

  @override
  State<feeScreen> createState() => __feeScreenState();
}

class __feeScreenState extends State<feeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Container(
            
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),
          )
        ],
      ),
    );
  }
}