import 'package:thuctapcoso/features/shop/models/category_model.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626659/vdde1iwlxlukechivdod.png'.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '5',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748655885/iawiqsg2zr3uap5yqt0l.png'.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748655948/t7b9rnvxdldrcegeyk6e.png'.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748656157/c6vpf7lqkgxkq96drisg.png'.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '4', image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626649/ddagy2wwhhlfdgmmnxzz.png'.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(
        id: '6', image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626651/fxlqnzptf5qmeuzp1j45.png'.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626646/a4beheun1uj1sa3otb1d.png'.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748656111/btdpp2dwj919hr6zei9g.png'.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748656265/aguitxk31hoql5dl4mqc.png'.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748656315/ajll2d79vohjtplejfjc.png'.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false),

    ///furniture
    CategoryModel(
        id: '11',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748656386/ornuiosl86s2ow4yez4e.png'.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748655885/iawiqsg2zr3uap5yqt0l.png'.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626648/rfw7qy28pqdh0dspjozz.png'.furnitureIcon,
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false),

    ///electronics
    CategoryModel(
        id: '14',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748655749/ntjtkemtpdgbhdreuukc.png'.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: 'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626653/nsonric15sqipzc1swbi.png'.electronicsIcon,
        name: 'Mobile',
        parentId: '2',
        isFeatured: false),
  ];
}
