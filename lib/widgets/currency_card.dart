import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final String amount;
  final String code;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: isInverted ? Colors.black : Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    color: isInverted ? Colors.black : Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  code,
                  style: TextStyle(
                    color: isInverted
                        ? Colors.black.withOpacity(0.8)
                        : Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
        Transform.scale(
          scale: 2.4,
          child: Transform.translate(
            offset: const Offset(8, 15),
            child: Icon(
              icon,
              size: 69,
              color: isInverted ? Colors.black : Colors.white38,
            ),
          ),
        ),
      ],
    );
  }
}
