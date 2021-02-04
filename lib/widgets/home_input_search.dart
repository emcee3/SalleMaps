import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/views/poi_search.dart';

class HomeInputSearch extends StatefulWidget {
  HomeInputSearch({Key key}) : super(key: key);

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
              Material(
                elevation: 2.0,
                borderRadius:
                    const BorderRadius.all(const Radius.circular(100.0)),
                child: TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  onTap: () => showSearch(
                    context: context,
                    delegate: POISearch(poiListViewModel),
                  ).then((value) => value.updatePoisToShow()),
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
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
