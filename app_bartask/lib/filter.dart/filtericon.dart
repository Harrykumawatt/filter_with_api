import 'package:flutter/material.dart';

import 'filterscreen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required String id,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilteScreen(
                    id: '',
                    text: '',
                  ),
                ));
          },
          icon: Icon(Icons.filter_alt)),
    );
  }
}
