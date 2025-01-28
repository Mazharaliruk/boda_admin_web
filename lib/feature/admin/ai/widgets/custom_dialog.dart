import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For clipboard actions
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../commons/common_widgets/app_text.dart';

void showCustomDialog(BuildContext context, String message,
    Function onRegenerate, Function onShorten, Function onLengthen) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          // Header with the logo and name
          Positioned(
            top: MediaQuery.of(context).size.height * 0.00,
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo/BODA-LOGO.png',
                    width: 80,
                    height: 80,
                  ),
                  Text(
                    'Pookie AI',
                    style: GoogleFonts.onest(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),

          // Response Dialog with scrollable text
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 5, color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    // Scrollable message area
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          text: "Here are a few ways you could respond:",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(text: message), // Main message content
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Actions list with each functionality
          Positioned(
            top: MediaQuery.of(context).size.height * 0.355,
            width: MediaQuery.of(context).size.width * 0.60,
            right: 40,
            height: MediaQuery.of(context).size.height * 0.50,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 5, color: Colors.grey.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/reverse.svg",
                      label: "Regenerate",
                      onTap: () {
                        onRegenerate();
                        Navigator.pop(context);
                      },
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/shorter.svg",
                      label: "Shorter",
                      onTap: () {
                        onShorten();
                        Navigator.pop(context);
                      },
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/longer.svg",
                      label: "Longer",
                      onTap: () {
                        onLengthen();
                        Navigator.pop(context);
                      },
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/copy.svg",
                      label: "Copy Text",
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: message));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Message copied")),
                        );
                        Navigator.pop(context);
                      },
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/select_all.svg",
                      label: "Select All",
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: message));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("All text selected")),
                        );
                        Navigator.pop(context);
                      },
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    _buildActionItem(
                      context,
                      iconPath: "assets/icons/share.svg",
                      label: "Share",
                      onTap: () {
                        Share.share(message);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildActionItem(BuildContext context,
    {required String iconPath,
    required String label,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: AppText(
              text: label,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
