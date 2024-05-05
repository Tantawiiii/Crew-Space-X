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
  late List<CrewModel> searchedForCrew;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CrewSpaceXCubit>(context).getAllCrews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.blueAccent,
        elevation: 3.0,
        title: _isSearching ? _buildSearchedTextField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching ?
        const BackButton(
          color: Colors.amber,
        ) : Container(),
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
        child: buildBlocWidget(),
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

  Widget _buildLoadingIndicator() {
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
          const SizedBox(
            height: 24,
          ),
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
      itemCount: _searchTextController.text.isEmpty ? allCrews.length : searchedForCrew.length,
      itemBuilder: (context, index) {
        return CrewItem(
          crews: _searchTextController.text.isEmpty ? allCrews[index] : searchedForCrew[index],
        );
      },
    );
  }

  Widget _buildSearchedTextField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: ColorsCode.blackColor700,
      decoration: InputDecoration(
        hintText: "Find a Crew",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: ColorsCode.whiteColor100,
          fontSize: 16,
        ),
      ),
      style: TextStyle(
        color: ColorsCode.whiteColor100,
        fontSize: 16,
      ),
      onChanged: (searchedCrew) {
        addSearchedForItemToSearchedList(searchedCrew);
      },
    );
  }

  void addSearchedForItemToSearchedList(String searchedCrew) {
    searchedForCrew = allCrews
        .where((crew) => crew.name!.toLowerCase().startsWith(searchedCrew))
        .toList();

    setState(() {});
  }


  Widget _buildAppBarTitle(){
    return     Text(
      "SpaceX Crews",
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
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearchHistory();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.amber,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  void _startSearching() {

    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: _stopSearching,
    ));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchHistory();
    setState(() {
    _isSearching = false;
    });
  }

  void _clearSearchHistory() {
    _searchTextController.clear();
  }



}

