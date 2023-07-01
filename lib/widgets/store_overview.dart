import 'package:flutter/material.dart';

class StoreOverviewCard extends StatelessWidget {
  const StoreOverviewCard(
      {super.key,
      required this.name,
      required this.points,
      required this.perksAvailable,
      required this.newPerks,
      required this.logoUrl,
      this.highlightNewPerks = true,
      this.onTap});

  final String name;
  final int points;
  final int perksAvailable;
  final int newPerks;
  final String logoUrl;
  final bool highlightNewPerks;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: newPerks > 0 && highlightNewPerks
              ? const Color(0xFF646464)
              : const Color(0xC4292929),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: ShapeDecoration(
                    color: newPerks > 0 && highlightNewPerks
                        ? const Color(0xFF181818)
                        : Colors.white,
                    shape: const OvalBorder(),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      logoUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${newPerks > 0 && highlightNewPerks ? newPerks : perksAvailable} ${newPerks > 0 && highlightNewPerks ? 'new perks' : 'perks available'}',
                      style: TextStyle(
                        fontSize: 14,
                        color: newPerks > 0 && highlightNewPerks
                            ? Colors.white
                            : Colors.white.withOpacity(0.6499999761581421),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    points.toString(),
                    style: const TextStyle(
                      color: Color(0xffA3DDC9),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
