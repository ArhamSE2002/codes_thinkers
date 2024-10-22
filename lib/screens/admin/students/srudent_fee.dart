import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_ground.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            if (_isSearching)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _toggleSearch,
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 20,
              right: 30,
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _toggleSearch,
              ),
            ),
            const Positioned(
                top: 60,
                left: 20,
                child: Text(
                  'Students',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Positioned(
                left: 160,
                top: 100,
                child: Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff1164AD)),
                )),
            const Positioned(
                top: 240,
                left: 220,
                child: Text(
                  'Paid/Unpaid',
                  style: TextStyle(color: Color(0xffFDD51D)),
                )),
            Positioned(
                left: 180,
                top: 120,
                child: Container(
                  height: 120,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffEAEAEA)),
                )),
            const Positioned(
                top: 130,
                left: 215,
                child: CustomPaint(
                  child: HalfColoredRing(),
                )),
            Positioned(
                left: 60,
                top: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff22406F)),
                      onPressed: () {},
                      label: const Icon(
                        Icons.ac_unit,
                        color: Color(0xff8596B0),
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff22406F)),
                        onPressed: () {},
                        label: const Text(
                          'Paid',
                          style: TextStyle(color: Color(0xff8596B0)),
                        )),
                    const SizedBox(
                      width: 60,
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff22406F)),
                        onPressed: () {},
                        label: const Text('Unpaid',
                            style: TextStyle(color: Color(0xff8596B0))))
                  ],
                )),
            Positioned(
                top: 320,
                left: 16,
                child: Card(
                  color: Color(0xff142E63),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const SizedBox(
                    width: 450,
                    height: 90,
                  ),
                )),
            const Positioned(
              left: 30,
              top: 335,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avator.jpg'),
              ),
            ),
            const Positioned(
                top: 335,
                left: 95,
                child: Text(
                  'Ali Hassan',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const Positioned(
                top: 360,
                left: 95,
                child: Text(
                  'Reg#',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
            const Positioned(
                top: 378,
                left: 90,
                child: Text(
                  '101',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Positioned(
                left: 280,
                top: 330,
                child: Container(
                  height: 30,
                  width: 130,
                  decoration: BoxDecoration(
                      color: const Color(0xff7494AF),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text(
                        'This Month',
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )),
            const Positioned(
                left: 410,
                top: 335,
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                )),
            const Positioned(
                top: 375,
                left: 340,
                child: Icon(
                  Icons.done,
                  size: 30,
                )),
            Positioned(
                left: 380,
                top: 375,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xffB49E26)),
                  onPressed: () {},
                  label: const Text('Paid'),
                )),
            Positioned(
                top: 550,
                left: 220,
                child: IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: Color(0xFFFDD51D),
                    radius: 20,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class HalfColoredRing extends StatelessWidget {
  final double size;

  const HalfColoredRing({Key? key, this.size = 100}) : super(key: key);

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
