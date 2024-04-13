import 'package:flutter/material.dart';
import 'package:hotel_app/data/model/room.dart';

import '../widgets/room_tiles.dart';

class OptionsPage extends StatefulWidget {
  static const routeName = '/optionsPage';
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  List<Room> availableRooms = rooms;
  void searchRooms(String query) {
    final suggestions = rooms.where((room) {
      final roomTitle = room.name.toLowerCase();
      final input = query.toLowerCase();
      return roomTitle.contains(input);
    }).toList();
    setState(() {
      query.isEmpty ? availableRooms = rooms : availableRooms = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus!.unfocus(),
          textInputAction: TextInputAction.search,
          cursorColor: const Color.fromRGBO(138, 128, 128, 1),
          style: const TextStyle(
            color: Color.fromRGBO(138, 128, 128, 1),
          ),
          decoration: InputDecoration(
            // focusColor: const Color.fromRGBO(242, 238, 238, 1),
            filled: true,
            fillColor: const Color.fromRGBO(242, 238, 238, 1),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            labelText: 'Type here to search for rooms...',
            labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(173, 164, 164, 1)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onChanged: (value) => searchRooms(value),
        ),
        actions: [
          IconButton(
            onPressed: () => FocusManager.instance.primaryFocus!.unfocus(),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            Image.asset('assets/images/beach.png'),
            Positioned(
              top: size.height * 0.16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                height: size.height * 0.75,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose the type of room you want',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),  
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RoomTiles(
                          size: size,
                          name: availableRooms[index].name,
                          imageURL: availableRooms[index].imageURL,
                        ),
                        itemCount: availableRooms.length,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ), 
                    const Text(
                      'Tap on any of the options listed above to continue booking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.01,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.035,
                    // color: Colors.black,
                    child: const Text(
                      'ATG',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '+ HOTELS',
                        style: TextStyle(
                          wordSpacing: 5,
                          fontFamily: 'Roboto',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'ROOMS',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
