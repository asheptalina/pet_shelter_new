import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/ui_consts/feed_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class FeedItemWidget extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String description;
  final String address;

  const FeedItemWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.address,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 1
            )
          ]
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          _buildImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: FeedUIConstants.gridItemInnerHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: FeedUIConstants.gridItemInnerVerticalPadding),
                _buildTitle(),
                const SizedBox(height: FeedUIConstants.gridItemInnerVerticalPadding / 2),
                _buildDescription(),
                const SizedBox(height: FeedUIConstants.gridItemInnerVerticalPadding),
                _buildAddress()
              ],
            ),
          ),
          const Spacer(),
        ],
      )
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : SvgPicture.asset(AppAssets.placeholderImage),
          errorBuilder: (context, err, _) => SvgPicture.asset(AppAssets.placeholderImage)
      )
    );
   }

  Widget _buildTitle() {
    return Text(
      title,
      style: MainUIConstants.bodyBoldTextStyle,
      maxLines: 1,
    );
  }

  Widget _buildDescription() {
    return Text(
      '$description\n',
      style: MainUIConstants.labelTextStyle,
      maxLines: 2,
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.locationMarker,
          width: FeedUIConstants.locationMarkerSize,
          height: FeedUIConstants.locationMarkerSize
        ),
        Expanded(
          child: Text(
            address,
            style: MainUIConstants.labelTextStyle.copyWith(color: AppColors.hintText),
            maxLines: 2,
          )
        )
      ],
    );
  }
}
