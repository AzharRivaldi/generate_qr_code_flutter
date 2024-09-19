import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Result QR Code'),
        centerTitle: true,
      ),
      body: Container(
        height: size.height * 0.50,
        width: size.width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Colors.green,
                Colors.greenAccent,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.decal
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(controller.text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: QrImageView(
                errorCorrectionLevel: QrErrorCorrectLevel.M,
                version: 6,
                eyeStyle: const QrEyeStyle(
                  color: Colors.black,
                  eyeShape: QrEyeShape.square,
                ),
                padding: const EdgeInsets.all(20),
                data: controller.text,
                size: 280,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
