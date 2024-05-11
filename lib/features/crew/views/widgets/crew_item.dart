import 'package:flutter/material.dart';
import 'package:space_x/core/utils/colors_code.dart';
import 'package:space_x/features/crew/data/models/CrewModel.dart';

import '../../../../core/utils/strings.dart';

class CrewItem extends StatelessWidget {
  final CrewModel crews;

  const CrewItem({super.key, required this.crews});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorsCode.whiteColor100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          onDetailsCrewScreenRoute,
          arguments: crews,
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: ColorsCode.blackColor100,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Text(
                  "${crews.name}",
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: ColorsCode.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  " ${crews.agency}",
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          child: Hero(
            tag: crews.id ?? "",
            child: Container(
              color: ColorsCode.whiteColor300,
              child: crews.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading_bar.gif',
                      image: crews.image ?? "",
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
