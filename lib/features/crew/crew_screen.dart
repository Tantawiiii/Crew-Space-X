import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/cuibt/crew_space_x_cubit.dart';
import 'package:space_x/features/widgets/crew_item.dart';

import '../../core/utils/colors_code.dart';
import '../../data/models/CrewModel.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({super.key});

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
  late List<CrewModel> allCrews;

  @override
  void initState() {
    super.initState();
    allCrews = BlocProvider.of<CrewSpaceXCubit>(context).getAllCrews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.blueAccent,
        elevation: 3.0,
        title: Text(
          'SpaceX Cub',
          style: TextStyle(color: ColorsCode.whiteColor200),
        ),
      ),
      body: Container(
        //width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back_spaceX.jpeg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Text(
                "SpaceX Crew",
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  color: ColorsCode.whiteColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 38.0,
                  shadows: const [
                    Shadow(
                      color: Colors.blue,
                      blurRadius: 4.0,
                      offset: Offset(5.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              buildBlocWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CrewSpaceXCubit, CrewSpaceXState>(
      builder: (context, state) {
        if (state is CrewLoaded) {
          allCrews = (state).crews;
          return buildLoadedCrewsListWidget();
        } else {
         return _buildLoadingIndicator();
        }
      },
    );
  }

  Widget _buildLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: ColorsCode.blue500,
      ),
    );
  }

  Widget buildLoadedCrewsListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCrewList(),
        ],
      ),
    );
  }

  Widget buildCrewList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
         itemCount: allCrews.length,
      itemBuilder: (context, index) {
        return CrewItem(crews: allCrews[index],);
      },
    );
  }
}
