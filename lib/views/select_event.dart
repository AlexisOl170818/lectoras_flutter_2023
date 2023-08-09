import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SelectEvent extends StatefulWidget {
  const SelectEvent({super.key});

  @override
  State<SelectEvent> createState() => _SelectEventState();
}

class _SelectEventState extends State<SelectEvent> {
  @override
  Widget build(BuildContext context) {
    final showCodeController = TextEditingController();

    void dispose() {
      showCodeController.dispose();
      super.dispose();
    }

    bool validateShowCodeInput() {
      Navigator.pop(context);
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      if (showCodeController.text.trim().isEmpty) {
        EasyLoading.dismiss();
        EasyLoading.showInfo('ShowCode empty... Try Again!',
            duration: Duration(milliseconds: 500));
        return false;
      }

      return true;
    }

    void openAddShowCode() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('SHOWCODE'),
          content: TextField(
            decoration: const InputDecoration(
              labelText: 'Enter your ShowCode',
            ),
            controller: showCodeController,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 66, 102, 131)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (validateShowCodeInput()) {
                      EasyLoading.dismiss();

                      EasyLoading.showSuccess('Event Selected',
                          duration: Duration(milliseconds: 500));
                      Navigator.pushNamed(context, 'enter_licence');
                      showCodeController.text = '';
                    }
                  },
                  child: const Text(
                    'Add',
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-lectoras.png',
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(
              height: 40,
            ),
            Text('SHOWCODE', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: 15,
            ),
            Text('Enter your ShowCode',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  openAddShowCode();
                },
                child: const Text('Enter your code'))
          ],
        ),
      ),
    );
  }
}
