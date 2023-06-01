import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/ui_consts/feed_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/loading_widget.dart';
import 'package:pet_shelter_new/views/feed/feed_item_widget.dart';
import 'package:routemaster/routemaster.dart';

class FeedWidget extends StatelessWidget {

  final FeedState state;

  const FeedWidget({required this.state, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    state.getAds(petType: state.petType);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTabBar(),
            ],
          ),
        ),
        body: _buildTabBarView(),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.white,
                    width: FeedUIConstants.inactiveIndicatorHeight
                )
            )
        ),
        child: TabBar(
          onTap: (index) {
            final PetType? petType;
            switch(index) {
              case 1:
                petType = PetType.dog;
                break;
              case 2:
                petType = PetType.cat;
                break;
              case 3:
                petType = PetType.other;
                break;
              default:
                petType = null;
                break;
            }
            state.onPetTypeChanged(petType);
          },
          tabs: const [
            Tab(text: AppStrings.allTab),
            Tab(text: AppStrings.dogsTab),
            Tab(text: AppStrings.catsTab),
            Tab(text: AppStrings.otherTab),
          ],
          labelStyle: MainUIConstants.textStyleSize16Weight700.copyWith(color: Colors.white),
          unselectedLabelColor: Colors.white,
          indicator: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.white,
                    width: FeedUIConstants.activeIndicatorHeight
                )
            ),
          ),
        )
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        _buildBody(),
        _buildBody(),
        _buildBody(),
        _buildBody()
      ],
    );
  }

  Widget _buildBody() {
    return Observer(
        builder: (ctxt) => state.inProgress
            ? const LoadingWidget()
            : state.announcements.isEmpty ? _buildErrorWidget(AppStrings.noAds) : _buildGrid(ctxt)
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
          vertical: MainUIConstants.verticalPadding,
          horizontal: FeedUIConstants.horizontalPadding
      ),
      crossAxisCount: 2,
      mainAxisSpacing: FeedUIConstants.gridSpacing,
      crossAxisSpacing: FeedUIConstants.gridSpacing,
      childAspectRatio: FeedUIConstants.gridItemAspectRatio,
      children: state.announcements.map((ad) => GestureDetector(
        onTap: () {
          state.onSelectedAnnouncement(ad);
          Routemaster.of(context).push('ad');
        },
        child: FeedItemWidget(
            imageUrl: ad.imageUrl,
            title: ad.title,
            description: ad.description,
            address: ad.address
        ),
      )).toList(growable: false),
    );
  }

  Widget _buildErrorWidget(String parameters) {
    return Center(
      child: Text(
        parameters,
        style: MainUIConstants.textStyleSize16Weight400.copyWith(color: AppColors.hintText)
      )
    );
  }
}
