import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomHorizontalRow extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isWeb;

  // Single color combination for all containers
  static const List<Color> gradientColors = [
    Color(0xFF1CB5E0),
    Color(0xFF0A3D62),
  ];

  const CustomHorizontalRow({
    Key? key,
    required this.title,
    required this.items,
    required this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardSize = isWeb ? 140 : 110;
    final double avatarRadius = isWeb ? 35 : 28;
    final double nameFontSize = isWeb ? 15 : 13;
    final double subjectFontSize = isWeb ? 13 : 11;
    final double titleFontSize = isWeb ? 20 : 14;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            minFontSize: 10,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: cardSize + 15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = items[index];

                return Container(
                  width: cardSize,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors[1].withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: item['image'] != null &&
                                item['image']!.isNotEmpty
                            ? AssetImage(item['image']!)
                            : const AssetImage('assets/default_teacher.jpg'),
                        backgroundColor: Colors.white24,
                      ),
                      const SizedBox(height: 8),
                      AutoSizeText(
                        item['name'] ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: nameFontSize,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 8,
                      ),
                      const SizedBox(height: 4),
                      AutoSizeText(
                        item['subject'] ?? '',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: subjectFontSize,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Custom Text Row ----------------
class CustomTextRow extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isWeb;

  static const List<Color> gradientColors = [
    Color(0xFFf1c27d),
    Color(0xFFc68642)
  ];

  const CustomTextRow({
    Key? key,
    required this.title,
    required this.items,
    required this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardSize = isWeb ? 140 : 110;
    final double nameFontSize = isWeb ? 15 : 13;
    final double titleFontSize = isWeb ? 20 : 14;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            minFontSize: 10,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: cardSize + 15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = items[index];

                return Container(
                  width: cardSize,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors[1].withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AutoSizeText(
                      item['text'] ?? '',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: nameFontSize - 1,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

 