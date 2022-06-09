import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';

import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.contract.dart';

class CatalogueFakeService implements ICatalogueService {
  final _catalogueList = <Catalogue>[
    Catalogue(
      id: 1,
      name: 'Rosticeria',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoqEb3n62wXBiS8y7jVrDbm9Ey7zLK7xe6n_xy_ilCcO6VU1PghRsuDMFBzLBZtzffnuo&usqp=CAU',
    ),
    Catalogue(
      id: 2,
      name: 'Pasteleria',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjaWMDtfgGZv01R3B7tUsrM4IKqN8-8PB6mA&usqp=CAU',
    ),
    Catalogue(
      id: 3,
      name: 'Postres',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGvh0a67siAg1pftfvNXpPpA3VdgX3CQj8bA&usqp=CAU',
    ),
    Catalogue(
      id: 4,
      name: 'Pan Artesanal',
      image:
          'https://phantom-elmundo.unidadeditorial.es/a01aaaa7dd38471dbdcd5607bdcc631d/resize/414/f/jpg/assets/multimedia/imagenes/2020/07/08/15942185940528.jpg',
    ),
    Catalogue(
      id: 5,
      name: 'Muffins',
      image:
          'https://t2.rg.ltmcdn.com/es/posts/0/4/4/muffins_de_pasas_13440_orig.jpg',
    ),
    Catalogue(
      id: 6,
      name: 'Gelatinas',
      image:
          'https://www.gastrolabweb.com/u/fotografias/m/2021/8/25/f608x342-18089_47812_15.jpg',
    ),
    Catalogue(
      id: 7,
      name: 'Bocadillos',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7a5y1HMqLkTedifHRqOoK4jBnfrs1PfWdEw&usqp=CAU',
    ),
  ];

  @override
  Future<List<Catalogue>> get() async {
    return _catalogueList;
  }
}
