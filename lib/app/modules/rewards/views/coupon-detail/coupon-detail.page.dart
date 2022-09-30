import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'coupon-detail.controller.dart';

class CouponDetailPage extends GetView<CouponDetailController> {
  const CouponDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.coupon$.value.shortDescription,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          backgroundColor: const Color(0xFF222222),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 10),
              controller.couponImage$.value != ''
                  ? _header()
                  : Container(
                      color: Colors.grey,
                      height: 220,
                      width: 200,
                      child: const Center(
                        child: Text('No hay imagen'),
                      ),
                    ),
              const SizedBox(height: 20),
              _center(),
              const SizedBox(height: 5),
              _bottomButton(context),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }

  Widget _header() {
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: Obx(() => controller.couponImage$.value != ''
            ? Image.network(controller.couponImage$.value)
            : const Center(child: CircularProgressIndicator())));
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
        Text('Valido Hasta ${controller.coupon$.value.endDate}',
            style: const TextStyle(fontSize: 14, color: Colors.white70)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: HtmlWidget(controller.coupon$.value.description,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
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
