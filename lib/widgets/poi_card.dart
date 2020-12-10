import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:salle_maps/view_models/poi_view_model.dart';

class POICard extends StatelessWidget {
  final POIViewModel poi;

  POICard({Key key, this.poi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              poi.poiData.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            buildInfo(poi, context),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 475.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton.icon(
              color: Color(0xFF69ade4),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              label: Text('Directions', style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.directions, color: Colors.white),
              onPressed: () {},
            ),
            RaisedButton.icon(
              color: Colors.white,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              label: Text('Save'),
              icon: Icon(Icons.favorite, color: Colors.pink),
              onPressed: () {},
            ),
            RaisedButton.icon(
              color: Colors.white,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              label: Text('Go to webpage'),
              icon: Icon(Icons.web_asset, color: Colors.black),
              onPressed: _launchUrl,
            ),
            RaisedButton.icon(
              color: Colors.white,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              label: Text('Share'),
              icon: Icon(Icons.share, color: Colors.blue[900]),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(POIViewModel poi, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            poi.poiData.nombreEn,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            poi.poiData.informacionEn,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            poi.poiStatus.estadoEn,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  _launchUrl() async {
    if (await canLaunch(poi.poiData.urlInfo)) {
      await launch(poi.poiData.urlInfo);
    } else {
      throw 'Could not launch ${poi.poiData.urlInfo}';
    }
  }
}
