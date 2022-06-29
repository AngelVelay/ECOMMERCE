import 'package:jexpoints/app/modules/main/entities/coupon-type.enum.dart';

import '../../entities/coupon.type.dart';
import 'coupons.contract.dart';

class CouponsFakeService implements ICouponsService {
  final _coupons = <Coupon>[
    Coupon(
        id: 1,
        name: 'Cupon de prueba 1',
        url:
            'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg',
        title: 'Titulo Cupon 1',
        shortDescription: '10% de descuento en gelatinas',
        description:
            'ypesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        terms:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
        couponPriorityId: 1,
        order: 0,
        validTo: DateTime.parse('2022-06-25 23:59:59'),
        couponTypeId: CouponTypeEnum.amount,
        code: '3X2D0N45',
        amount: 100),
    Coupon(
        id: 2,
        name: 'Cupon 2',
        url:
            'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg',
        title: 'Titulo Cupon 2',
        shortDescription: 'Donas al 3x2',
        description:
            ' the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, co',
        terms:
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
        couponPriorityId: 2,
        order: 0,
        validTo: DateTime.parse('2022-06-20 23:59:59'),
        couponTypeId: CouponTypeEnum.amount,
        code: '2X1P4ND0',
        amount: 100),
    Coupon(
        id: 2,
        name: 'Cupon 2',
        url:
            'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg',
        title: 'Titulo Cupon 2',
        shortDescription: 'Donas al 3x2',
        description:
            ' the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, co',
        terms:
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
        couponPriorityId: 2,
        order: 0,
        validTo: DateTime.parse('2022-06-20 23:59:59'),
        couponTypeId: CouponTypeEnum.amount,
        code: '15%D3SC',
        amount: 100),
    Coupon(
        id: 2,
        name: 'Cupon 2',
        url:
            'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg',
        title: 'Titulo Cupon 2',
        shortDescription: 'Donas al 3x2',
        description:
            ' the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, co',
        terms:
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
        couponPriorityId: 2,
        order: 0,
        validTo: DateTime.parse('2022-06-20 23:59:59'),
        couponTypeId: CouponTypeEnum.percentage,
        code: '30%D3SC',
        amount: 10),
  ];

  @override
  Future<List<Coupon>> get() async {
    return _coupons;
  }
}
