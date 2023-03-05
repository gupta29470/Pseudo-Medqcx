import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/common/constants.dart';
import 'package:pseudo_medqcx/common/extensions.dart';
import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';
import 'package:pseudo_medqcx/device_list/widgets/device_card_widget.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

class DeviceListWidget extends StatefulWidget {
  final List<DeviceListModelList?> list;

  const DeviceListWidget({
    super.key,
    required this.list,
  });

  @override
  State<DeviceListWidget> createState() => _DeviceListWidgetState();
}

class _DeviceListWidgetState extends State<DeviceListWidget> {
  ValueNotifier<String> filterValueNotifier =
      ValueNotifier<String>(Constants.deviceFilterList[0]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 28, right: 16),
                child: DropdownButton(
                  value: filterValueNotifier.value,
                  items: Constants.deviceFilterList.map(
                    (filterValue) {
                      return DropdownMenuItem(
                        value: filterValue,
                        child: Text(
                          filterValue,
                          style: TextThemeHelper.black_20_700,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    filterValueNotifier.value = value ?? "";
                    context.deviceListCubit.filterDeviceList(
                      filterValueNotifier.value,
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: ((context, index) {
                DeviceListModelList? model = widget.list[index];

                if (model != null) {
                  return DeviceCardWidget(
                    model: model,
                  );
                }

                return const SizedBox.shrink();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
