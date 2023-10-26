import 'package:flutter/material.dart';

class FilterDiscover extends StatefulWidget {
  const FilterDiscover({super.key});

  @override
  State<FilterDiscover> createState() => _FilterDiscoverState();
}

class _FilterDiscoverState extends State<FilterDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
    body: const Center(child: Text("Filter Person")),
    );
    
  }
}