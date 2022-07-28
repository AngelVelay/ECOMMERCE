import 'package:jexpoints/app/modules/main/entities/category.type.dart';
import 'categories.contract.dart';

class CategoriesFakeService implements ICategoriesService {
  final _categoryList = <Category>[
    Category(
        id: 2,
        name: 'Pasteleria',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/pastel-vegano-0513474608544947.jpg',
        businessLineId: 1),
    Category(
        id: 3,
        name: 'Postres',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/pay-queso-individual-0222490481204582.jpg',
        businessLineId: 1),
    Category(
        id: 4,
        name: 'Pan',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/mantecada-0250189888873226.jpg',
        businessLineId: 1),
    Category(
        id: 5,
        name: 'Muffins',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/muffin-marmoleado-0578852714774596.jpg',
        businessLineId: 1),
    Category(
        id: 6,
        name: 'Gelatinas',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/estrella-fresa-019621345363381.jpg',
        businessLineId: 1),
    Category(
        id: 7,
        name: 'Bocadillos',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/chapata-milanesa-0643137035725236.jpg',
        businessLineId: 1),
    Category(
        id: 1,
        name: 'Rosticeria',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/division/sgpollo-rostizado-0851114673936327.jpg',
        businessLineId: 2),
    Category(
        id: 2,
        name: 'Complementos',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/arroz-0736434051178598.jpg',
        businessLineId: 2),
    Category(
        id: 3,
        name: 'Salsas',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/habanero-00048088030912023.jpg',
        businessLineId: 2),
    Category(
        id: 4,
        name: 'Papas Fritas',
        image:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/papas-saladas-051149212034023.jpg',
        businessLineId: 3)
  ];

  @override
  Future<List<Category>> get() async {
    return _categoryList;
  }
}
