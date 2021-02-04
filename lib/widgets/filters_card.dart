import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_type_view_model.dart';

class FiltersCard extends StatefulWidget {
  @override
  _FiltersCardState createState() => _FiltersCardState();
}

class _FiltersCardState extends State<FiltersCard> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<POIListViewModel>(context);

    return Card(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by point of interest type:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: vm.poiTypes
                    .map((typeVM) => _buildTypeOption(typeVM, vm))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeOption(POITypeViewModel type, POIListViewModel vm) {
    bool isSelected = vm.typeFilters.contains(type.id);
    return GestureDetector(
      onTap: () => vm.selectTypeFilter(type.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 2.0,
            shape: CircleBorder(),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Color(0xFF69ade4) : Colors.white,
                boxShadow: [BoxShadow(blurRadius: 1.0)],
              ),
              child: type.id == '1'
                  ? Icon(Icons.hotel)
                  : type.id == '2'
                      ? Icon(Icons.restaurant)
                      : type.id == '3'
                          ? Icon(Icons.attractions)
                          : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(type.tipoEn, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
