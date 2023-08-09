import 'package:flutter/material.dart';

class EnterLicence extends StatelessWidget {
  const EnterLicence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Abastur 2023',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.onError,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Scan your licence...',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: 15,
            ),
            Text('Now you need scan your licence to start!',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'qr_scan');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code),
                      SizedBox(
                        width: 5,
                      ),
                      Text('SCAN'),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
