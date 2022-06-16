import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'package:marquee/marquee.dart';
import 'coupon-detail.controller.dart';

class CouponDetailPage extends GetView<CouponDetailController> {
  const CouponDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.coupon$.value.shortDescription),
          backgroundColor: const Color(0xFF222222),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 10),
              _header(),
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
      child: Image(
        image: NetworkImage(controller.coupon$.value.url),
      ),
    );
  }

  Widget _title() {
    return Text(controller.coupon$.value.title,
        style: const TextStyle(fontSize: 25, color: Colors.white));
  }

  Widget _center() {
    return Column(
      children: [
        Text('Valido Hasta ${controller.coupon$.value.formattedValidTo}',
            style: const TextStyle(fontSize: 14, color: Colors.white70)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(controller.coupon$.value.description,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
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
        height: MediaQuery.of(context).size.height - 135,
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              controller.coupon$.value.terms,
            ),
          ),
        ),
      ),
    );
  }
}
