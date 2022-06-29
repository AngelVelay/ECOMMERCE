import 'dart:convert';
import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.contract.dart';
import 'package:http/http.dart' as http;
class CatalogueFakeService implements ICatalogueService {
  final _catalogueList = <Catalogue>[
    // Catalogue(
    //   id: 1,
    //   name: 'Rosticeria',
    //   image:
    //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoqEb3n62wXBiS8y7jVrDbm9Ey7zLK7xe6n_xy_ilCcO6VU1PghRsuDMFBzLBZtzffnuo&usqp=CAU',
    // ),
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

    final _catalogueListSantoGallo = <Catalogue>[
    Catalogue(
      id: 1,
      name: 'Rosticeria',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoqEb3n62wXBiS8y7jVrDbm9Ey7zLK7xe6n_xy_ilCcO6VU1PghRsuDMFBzLBZtzffnuo&usqp=CAU',
    ),
    Catalogue(
      id: 2,
      name: 'Complementos',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/arroz-0736434051178598.jpg',
    ),
    Catalogue(
      id: 3,
      name: 'Salsas',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/habanero-00048088030912023.jpg',
    ),
    Catalogue(
      id: 4,
      name: 'Papas Fritas',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/papas-saladas-051149212034023.jpg',
    )
  ];

  @override
  Future<List<Catalogue>> get() async {

    // final response = await http.get(
    //   Uri.parse(
    //       'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/db755596-ed44-417b-9a5a-8512964932a8/branches'),
    // );
    // return json.decode(response.body);

    return _catalogueList;

  }


  @override
  Future<List<Catalogue>> getSantoGallo() async {
    return _catalogueListSantoGallo;
  }

}
