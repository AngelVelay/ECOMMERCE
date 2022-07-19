import 'dart:convert';
import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.contract.dart';
import 'package:http/http.dart' as http;
class CatalogueFakeService implements ICatalogueService {
  final _catalogueList = <Catalogue>[
    Catalogue(
      id: 2,
      name: 'Pasteleria',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/pastel-vegano-0513474608544947.jpg',
    ),
    Catalogue(
      id: 3,
      name: 'Postres',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/pay-queso-individual-0222490481204582.jpg',
    ),
    Catalogue(
      id: 4,
      name: 'Pan',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/mantecada-0250189888873226.jpg',
    ),
    Catalogue(
      id: 5,
      name: 'Muffins',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/muffin-marmoleado-0578852714774596.jpg',
    ),
    Catalogue(
      id: 6,
      name: 'Gelatinas',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/estrella-fresa-019621345363381.jpg',
    ),
    Catalogue(
      id: 7,
      name: 'Bocadillos',
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/chapata-milanesa-0643137035725236.jpg',
    ),
  ];

    final _catalogueListSantoGallo = <Catalogue>[
    Catalogue(
      id: 1,
      name: 'Rosticeria', 
      image:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/sgpollo-rostizado-0851114673936327.jpg',
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
