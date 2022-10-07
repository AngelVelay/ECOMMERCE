import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/app-bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'coupon-detail.controller.dart';

class CouponDetailPage extends GetView<CouponDetailController> {
  const CouponDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: controller.coupon$.value.shortDescription),
        body: SingleChildScrollView(child: Obx(() {
          return Column(
            children: [
              // const SizedBox(height: 20),
              // _title(),
              const SizedBox(height: 20),
              _imageWidget(),
              const SizedBox(height: 20),
              _center(),
              const SizedBox(height: 20),
              _bottomButton(context),
              const SizedBox(height: 20),
            ],
          );
        })));
  }

  Widget _imageWidget() {
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: controller.couponImage$.value != ''
            ? Image.network(controller.couponImage$.value)
            : const Center(child: CircularProgressIndicator()));
  }

  Widget _title() {
    return Text(controller.coupon$.value.title,
        style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            overflow: TextOverflow.ellipsis));
  }

  Widget _center() {
    return Column(
      children: [
        Text('Valido Hasta ${controller.formattedEndDate}',
            style: const TextStyle(fontSize: 14, color: Colors.white70)),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Descripción', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            HtmlWidget(controller.coupon$.value.description,
                textStyle:
                    const TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ).paddingAll(10)
      ],
    );
  }

  Widget _bottomButton(BuildContext context) {
    return CustomRoundedButton(
        text: 'Terminos y condiciones',
        onPressed: () => controller.showTerms(context, _terms(context)));
  }

  Widget _terms(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 300,
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: HtmlWidget(
              controller.coupon$.value.terms,
            ),
          ),
        ),
      ),
    );
  }
}
