import 'package:flutter/material.dart';

class CustomHorizontalRow extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isWeb;

  // Single color combination for all containers
  static const List<Color> gradientColors = [
    Color(0xFF1CB5E0), // teal
    Color(0xFF0A3D62), // navy
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
    final double titleFontSize = isWeb ? 20: 14;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
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
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
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

                      Text(
                        item['name'] ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: nameFontSize,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item['subject'] ?? '',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: subjectFontSize,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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



class CustomTextRow extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final bool isWeb;

  // Single color combination for all containers
  static const List<Color> gradientColors = [
    // Color(0xFF00B286), 
    // Color(0xFF00B2A9), 
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
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: cardSize + 15, // Increased height for multiple lines
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
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
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
                      // Fixed text display with proper constraints
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            item['text'] ?? '',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: nameFontSize - 1, // Slightly smaller font
                              height: 1.3, // Better line height
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ),
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