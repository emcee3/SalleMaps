import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/views/poi_search.dart';

class HomeInputSearch extends StatefulWidget {
  @override
  _HomeInputSearch createState() => new _HomeInputSearch();
}

class _HomeInputSearch extends State<HomeInputSearch> {
  @override
  Widget build(BuildContext context) {
    final poiListViewModel = Provider.of<POIListViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 80.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                autofocus: false,
                onTap: () => showSearch(
                  context: context,
                  delegate: POISearch(poiListViewModel.pois),
                ),
                decoration: InputDecoration(
                  hintText: 'Search point of interest...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(100.0)),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/default_user.png'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Order by: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FilterChip(
                label: Text('Distance'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.white,
                selectedColor: Color(0xFF69ade4),
                elevation: 2.0,
              ),
              FilterChip(
                label: Text('Alphabetic'),
                selected: true,
                onSelected: (bool selected) {},
                backgroundColor: Colors.white,
                selectedColor: Color(0xFF69ade4),
                elevation: 2.0,
              ),
              FilterChip(
                label: Text('Type'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.white,
                selectedColor: Color(0xFF69ade4),
                elevation: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
