import 'package:jexpoints/app/modules/main/entities/coupon-type.enum.dart';

import '../../entities/coupon.type.dart';
import 'coupons.contract.dart';

class CouponsFakeService implements ICouponsService {
  final _coupons = <Coupon>[
    Coupon(
        id: 1,
        name: 'Cupon de prueba 1',
        url:
            'https://i.postimg.cc/DZkq32br/10OFF.jpg',
        title: '10% OFF',
        shortDescription: '10% OFF en tu primera compra',
        description:
            'Utiliza este cupon para obtener un 10% de descuento en tu primera compra.',
        terms:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
        couponPriorityId: 1,
        order: 0,
        validTo: DateTime.parse('2022-06-25 23:59:59'),
        couponTypeId: CouponTypeEnum.amount,
        code: '10OFFD3SC',
        amount: 100),
    Coupon(
        id: 2,
        name: 'Cupon 2',
        url:
            'https://i.postimg.cc/L5mLhNDh/2x1.jpg',
        title: '2x1 en Pan Dulce',
        shortDescription: 'Pan al 2x1',
        description:
            'Ocupa este codigo para obtener donas al 2x1, solo en la tienda.',
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
            'https://i.postimg.cc/2jxngNjW/HAPPY-HOUR.jpg',
        title: 'Happy Hour',
        shortDescription: 'Happy Hour',
        description:
            'Rapido, corre por tu gelatina o pastel, obten un 10% de descuento utilizando este codigo.',
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
            'https://i.postimg.cc/8cwWvMX4/REFIERE-AMIGOS.jpg',
        title: 'Refire Amigos',
        shortDescription: 'Refire Amigos',
        description:
            ' Refiere a tus amigos y tú y ellxs reciben 150 puntos cada uno.',
        terms:
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
        couponPriorityId: 2,
        order: 0,
        validTo: DateTime.parse('2022-06-20 23:59:59'),
        couponTypeId: CouponTypeEnum.percentage,
        code: '150PTSD3SC',
        amount: 10),
  ];

  @override
  Future<List<Coupon>> get() async {
    return _coupons;
  }
}
