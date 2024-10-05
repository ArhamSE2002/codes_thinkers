import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
      //   backgroundColor: const Colors.,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://tse4.mm.bing.net/th?id=OIP.ylbd09kNzJAeoGZ194sWFwHaEc&pid=Api&P=0&h=220',
            ),
            const Text(
              'Congratulations! You Have Successfully Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
    ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
));
}
}