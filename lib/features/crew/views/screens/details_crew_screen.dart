import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_x/core/utils/colors_code.dart';
import 'package:space_x/features/crew/data/models/CrewModel.dart';

class DetailsCrewScreen extends StatelessWidget {
  final CrewModel crew;

  const DetailsCrewScreen({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCrewInfo("Name: ", " ${crew.name}"),
                      _buildDivider(320.0),
                      _buildCrewInfo("Agency: ", " ${crew.agency}"),
                      _buildDivider(302.0),
                      _buildCrewInfo("wikipedia: ", " ${crew.wikipedia}"),
                      _buildDivider(290.0),
                      _buildCrewInfo("Status: ", " ${crew.status}"),
                      _buildDivider(315.0),
                      const SizedBox(
                        height: 500,
                      ),
                      _buildDivider(0.0),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(double endIndent) {
    return Divider(
      color: Colors.amber,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget _buildCrewInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                color: ColorsCode.whiteColor300,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 680,
      pinned: true,
      stretch: true,
      backgroundColor: ColorsCode.blackColor100,
      flexibleSpace: FlexibleSpaceBar(
         //centerTitle: true,
        title: Text(
          crew.name ?? "",
          style: TextStyle(
            color: ColorsCode.whiteColor300,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: crew.id ?? "",
          child: Image.network(
            crew.image ?? "",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
