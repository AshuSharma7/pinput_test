import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pinput/pinput.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pin Page'),
      ),
      body: Column(
        children: [
          Text("PIN LOGIN"),
          Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Pinput(
                      key: Key("pin"),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // controller: textController,
                      autofocus: true,
                      onChanged: (val) {
                        ///Reset pinError if any
                        // if (state.pinError == true) {
                        //   notifier.resetPinError();
                        // }
                        // notifier.setIsValidated(validated: val.length == 4);
                      },
                      mainAxisAlignment: MainAxisAlignment.start,
                      defaultPinTheme: PinTheme(
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.w600
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black
                          ),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.w600
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Elevated button with verify text
                  ElevatedButton(onPressed: () {}, child: Text("Verify"))
        ],
      ),
    );
  }
}
