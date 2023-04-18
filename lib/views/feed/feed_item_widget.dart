import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
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
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                _buildTitle(),
                SizedBox(height: 4,),
                _buildDescription(),
                SizedBox(height: 8,),
                _buildAddress()
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (_, url, error) => SvgPicture.asset(AppAssets.placeholderImage),
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
      description,
      style: MainUIConstants.labelTextStyle,
      maxLines: 2,
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.locationMarker, width: 16, height: 21,),
        Text(
          address,
          style: MainUIConstants.labelTextStyle.copyWith(color: AppColors.hintText),
          maxLines: 2,
        )
      ],
    );
  }
}
