import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'RIDE MINE',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 68,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
