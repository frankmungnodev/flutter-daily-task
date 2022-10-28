import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final void Function()? onClick;
  const SettingItem({
    Key? key,
    required this.title,
    this.subTitle,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: subTitle != null
                    ? Text(
                        subTitle!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.apply(color: Colors.grey),
                      )
                    : const Center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
