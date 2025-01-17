import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transviti_test/core/constants/app_colors.dart';
import 'package:transviti_test/core/extensions/space_extension.dart';
import 'package:transviti_test/core/services/url_launcher.dart';
import 'package:transviti_test/core/utils/widget/text/text_widget.dart';
import 'package:transviti_test/models/trending_repos_model.dart';

class CardWidget extends StatelessWidget {
  final Item itemData;
  final RxBool isExpanded = false.obs;

  CardWidget({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isExpanded.toggle(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 4.0,
          shadowColor: AppColors.primary.withOpacity(.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 10.0,
              leading: CircleAvatar(
                radius: 22,
                backgroundImage:
                    CachedNetworkImageProvider(itemData.owner!.avatarUrl!),
              ),
              title: text(
                context: context,
                text: itemData.name!,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              subtitle: Column(
                children: [
                  Row(children: [
                    _buildRepoInfoRow(
                        context, "- Public Repo : ", Icons.check_circle),
                    const Spacer(),
                    _buildRepoInfoRow(
                        context,
                        "- Has Issues : ",
                        itemData.openIssues != null && itemData.openIssues! > 0
                            ? Icons.check_circle
                            : Icons.cancel),
                  ]),
                  const Divider(),
                  _buildRepoDetails(context),
                  Obx(
                    () => isExpanded.value
                        ? _buildExpandedView(context)
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRepoInfoRow(BuildContext context, String label, IconData icon) {
    return Row(
      children: [
        shortSpace,
        text(
          context: context,
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        Icon(icon, size: 15, color: AppColors.primary),
      ],
    );
  }

  Column _buildRepoDetails(BuildContext context) {
    return Column(
      children: [
        _buildRepoDetailRow(context, CupertinoIcons.eye_fill,
            "Repo being watched by :", itemData.watchers.toString()),
        _buildRepoDetailRow(context, Icons.play_for_work_sharp,
            "Repo Forked by :", itemData.forks.toString()),
      ],
    );
  }

  Row _buildRepoDetailRow(
      BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        shortSpaceh,
        text(
            context: context,
            text: label,
            fontSize: 13,
            fontWeight: FontWeight.w500),
        const Spacer(),
        text(
            context: context,
            text: value,
            fontSize: 13,
            fontWeight: FontWeight.w500),
      ],
    );
  }

  Column _buildExpandedView(BuildContext context) {
    return Column(
      children: [
        if (itemData.language != null)
          Row(
            children: [
              _buildRepoTypeRow(context, Icons.circle, itemData.language ?? ""),
              const Spacer(),
              _buildRepoTypeRow(context, Icons.star, itemData.score.toString()),
            ],
          ),
        GestureDetector(
          onTap: () => launchURL(itemData.htmlUrl!),
          child: text(context: context, text: itemData.htmlUrl!),
        ),
      ],
    );
  }

  Row _buildRepoTypeRow(BuildContext context, IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        shortSpaceh,
        text(
          context: context,
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
