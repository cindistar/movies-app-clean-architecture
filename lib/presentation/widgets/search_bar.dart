import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF292A37),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search ",
                hintStyle: TextStyle(
                  color: Color(0xFF7D7E81),
                  fontSize: 20,
                ),
                icon: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            color: Color(0xFF56575A),
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.chevron_right_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
