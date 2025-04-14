import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 62, 25),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 234, 226, 199)),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.arrow_forward, color: Color.fromARGB(255, 234, 226, 199)),
          ],
        ),
      ),
    );
  }
}
