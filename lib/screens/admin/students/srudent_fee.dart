import 'package:codes_thinkers/screens/admin/students/chalaan_student.dart';
import 'package:codes_thinkers/screens/admin/students/new_studentfee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attendancestd extends StatefulWidget {
  const Attendancestd({super.key});

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendancestd> {
  String paymentStatus = 'Unpaid';
  Color buttonColor = Colors.red;

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  bool isPaid = false;
  String selectedDate = 'This Month';

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat('MMM yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 500;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screenbackground.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              if (_isSearching)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SearchBar(
                      controller: _searchController,
                      hintText: 'Search...',
                    ),
                  ),
                ),
              Positioned(
                top: screenHeight * 0.02,
                right: screenWidth * 0.05,
                child: IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onPressed: _toggleSearch,
                ),
              ),
              Positioned(
                top: screenHeight * 0.06,
                left: screenWidth * 0.05,
                child: const Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Text(
                    'Students',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                  left: 80,
                  top: 150,
                  child: Container(
                      height: 160,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff1164AD),
                      ))),
              Positioned(
                  left: 110,
                  top: 165,
                  child: Container(
                      height: 120,
                      width: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ))),
              const Positioned(
                top: 175,
                left: 135,
                child: CustomPaint(
                  child: HalfColoredRing(),
                ),
              ),
              const Positioned(
                top: 290,
                left: 145,
                child: Text(
                  'Paid/Unpaid',
                  style: TextStyle(color: Color(0xffFDD51D)),
                ),
              ),
              Positioned(
                left: screenWidth * 0.0001,
                top: screenHeight * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 12,
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff22406F)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentChalaan(),
                              ));
                        },
                        icon: const Icon(
                          Icons.today_outlined,
                          color: Color(0xff8596B0),
                        ),
                        label: const Text('Upload Challan'),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isPaid
                                ? const Color(0xffB49E26)
                                : const Color(0xff22406F)),
                        onPressed: () {
                          setState(() {
                            isPaid = !isPaid;
                          });
                        },
                        icon: const SizedBox.shrink(),
                        label: Text(
                          isPaid ? 'Paid' : 'Unpaid',
                          style: const TextStyle(color: Color(0xff8596B0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.45,
                left: screenWidth * 0.05,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Card(
                    color: const Color(0xff142E63),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.12,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.47,
                child: const Padding(
                  padding: EdgeInsets.only(top: 38),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/avator.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 390, left: 100),
                child: Positioned(
                  top: screenHeight * 0.47,
                  left: screenWidth * 0.25,
                  child: const Text(
                    'Ali Hassan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 415, left: 100),
                child: Positioned(
                  top: screenHeight * 0.5,
                  left: screenWidth * 0.25,
                  child: const Text(
                    'Reg#',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 430, left: 100),
                child: Positioned(
                  top: screenHeight * 0.52,
                  left: screenWidth * 0.25,
                  child: const Text(
                    '101',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 385, left: 195),
                child: Positioned(
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                          color: const Color(0xff7494AF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          Text(
                            selectedDate,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 310, top: 375),
                child: Positioned(
                  left: screenWidth * 0.88,
                  top: screenHeight * 0.47,
                  child: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.white,
                    ),
                    onSelected: (String value) {
                      setState(() {
                        if (value == 'Paid') {
                          paymentStatus = 'Paid';
                          buttonColor = Colors.green;
                        } else if (value == 'Unpaid') {
                          paymentStatus = 'Unpaid';
                          buttonColor = Colors.red;
                        }
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Paid',
                        child: Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Paid'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Unpaid',
                        child: Row(
                          children: [
                            Icon(Icons.money_off, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Unpaid'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 420, left: 220),
                child: Positioned(
                  left: screenWidth * 0.75,
                  top: screenHeight * 0.53,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.check),
                    label: Text(paymentStatus),
                  ),
                ),
              ),
              Positioned(
                  top: screenHeight * 0.75,
                  left: screenWidth * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Newstudent1(),
                            ));
                      },
                      icon: const CircleAvatar(
                        backgroundColor: Color(0xFFFDD51D),
                        radius: 20,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class HalfColoredRing extends StatelessWidget {
  final double size;

  const HalfColoredRing({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: HalfRingPainter(),
    );
  }
}

class HalfRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint yellowPaint = Paint()
      ..color = const Color(0xffFDD51D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double yellowSweepAngle = 240 * (3.14 / 180);
    double whiteSweepAngle = 120 * (3.14 / 180);

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2 - 5),
      -90 * (3.14 / 180),
      yellowSweepAngle,
      false,
      yellowPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2 - 5),
      -90 * (3.14 / 180) + yellowSweepAngle,
      whiteSweepAngle,
      false,
      whitePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
