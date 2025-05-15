import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shadowColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 22,
                ),
              )),
        ));
  }
}
