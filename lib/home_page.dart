import 'package:flutter/material.dart';
import 'package:generate_qr_code/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clear();
                            setState(() {});
                          },
                          icon: const Icon(
                              Icons.cancel,
                              color: Colors.red)
                  ) : null,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.amber, width: 2
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.green, width: 2
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Input your text',
                  labelStyle: const TextStyle(
                      color: Colors.black
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: size.width * 0.50,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text('Ups, inputan tidak boleh kosong!',
                                    style: TextStyle(
                                        color: Colors.white)
                                ),
                              ],
                            ),
                            backgroundColor: Colors.red,
                            shape: StadiumBorder(),
                            behavior: SnackBarBehavior.floating,
                          ));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) {
                                return ResultPage(controller);
                              }),
                            ),
                          );
                        }
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Center(
                      child: Text(
                        'Generate QR Code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
