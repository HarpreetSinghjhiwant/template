import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';  // Import provider
import 'package:template/components/drop_down.dart';
import 'package:template/components/home_page_buttons.dart';
  // Import your MusicModel class
import 'package:template/models/music_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the MusicState using Consumer
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back),
                Text(
                  'Video Music Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                SizedBox(
                  width: 22,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 25,
                    children: [
                      Text(
                        'Total Video Duration: 3:45',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Total Music Duration: 3:45',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Selected Music: ${context.watch<MusicState>().selectedMusic.name}',  // Watch the selected music from provider
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      DropDown(),
                    ],
                  ),
                ),
                !context.watch<MusicState>().isDropdownVisible
                    ? HomePageButtons(
                  setAudio: (url) {
                    context.read<MusicState>().updateAudioPath(url);  // Set audio path through provider
                  },)
                    : Container(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
