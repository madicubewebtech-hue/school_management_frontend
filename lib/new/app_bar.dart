import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class EnhancedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isWeb;
  
  const EnhancedAppBar({
    super.key,
    required this.isWeb,
  });

  @override
  Size get preferredSize => Size.fromHeight(isWeb ? 140 : 120);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      toolbarHeight: isWeb ? 140 : 120,
      backgroundColor: AppColors.green,
      automaticallyImplyLeading: false, // ← यह false ही रखें
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.green,
              AppColors.green.withOpacity(0.9),
              AppColors.green.withOpacity(0.8),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          top: MediaQuery.of(context).padding.top + (isWeb ? 30 : 24),
          bottom: 16,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo with enhanced design - FIXED: Drawer functionality वापस
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Builder(
                  builder: (context) => InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.white30,
                    highlightColor: Colors.white24,
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/school_logo.png',
                        height: isWeb ? 48 : 40,
                        width: isWeb ? 48 : 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(
                          Icons.school_rounded,
                          size: isWeb ? 42 : 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // School name with enhanced typography
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Demo Public School",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isWeb ? 26 : 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Excellence in Education",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: isWeb ? 14 : 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Optional: Add some action icons
              if (isWeb) ...[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 28,
                  ),
                  tooltip: 'Notifications',
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  tooltip: 'Search',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}