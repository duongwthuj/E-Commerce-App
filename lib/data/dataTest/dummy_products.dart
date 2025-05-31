import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/models/product_attribute_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/models/product_variation_model.dart';

class TDummyProducts {
  static final List<ProductModel> products = [
    ProductModel(
      id: '1',
      title: 'Nike Air Max 270',
      stock: 15,
      price: 299.99,
      salePrice: 249.99,
      description:
          'The Nike Air Max 270 delivers visible cushioning under every step with a large window and fresh color.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626359/j00up42g8ff3xfdhpyt0.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629921/w4ddym4vgmiwn6ftzqhv.webp',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630000/atx8wlssob9r0fe8pyo2.webp',
      ],
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626622/efijsm6eudooxowqkda4.png',
        productCount: 45,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'White', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '1',
          sku: 'NIK-AM270-BLK-7',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629921/w4ddym4vgmiwn6ftzqhv.webp',
          price: 299.99,
          salePrice: 249.99,
          stock: 5,
          attributes: {'Color': 'Black', 'Size': '7'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'NIK-AM270-WHT-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630240/ge7m6loxhgkc5l9m7xcc.jpg',
          price: 299.99,
          salePrice: 249.99,
          stock: 10,
          attributes: {'Color': 'White', 'Size': '8'},
        ),
      ],
    ),
    ProductModel(
      id: '2',
      title: 'Adidas Ultraboost 22',
      stock: 20,
      price: 279.99,
      salePrice: 229.99,
      description:
          'The Ultraboost 22 features a responsive Boost midsole and a Primeknit upper that adapts to your foot.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630368/pwytmpjdqcdwrp6col20.webp',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630368/pwytmpjdqcdwrp6col20.webp',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630437/fekdinc6bscvdpenbqhd.webp',
      ],
      brand: BrandModel(
        id: '2',
        name: 'Adidas',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626611/azbzyct37rwszc1gqesh.png',
        productCount: 38,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Grey', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '3',
          sku: 'ADI-UB22-BLU-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630368/pwytmpjdqcdwrp6col20.webp',
          price: 279.99,
          salePrice: 229.99,
          stock: 8,
          attributes: {'Color': 'Blue', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '4',
          sku: 'ADI-UB22-GRY-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630437/fekdinc6bscvdpenbqhd.webp',
          price: 279.99,
          salePrice: 229.99,
          stock: 12,
          attributes: {'Color': 'Grey', 'Size': '10'},
        ),
      ],
    ),
    ProductModel(
      id: '3',
      title: 'Puma RS-X',
      stock: 18,
      price: 259.99,
      salePrice: 199.99,
      description:
          'The RS-X combines retro style with modern comfort for a versatile everyday sneaker.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630585/ons8fzyawegllp1bh3zx.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630585/ons8fzyawegllp1bh3zx.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630650/kasdqxl6hjnjnlyukutd.webp',
      ],
      brand: BrandModel(
        id: '3',
        name: 'Puma',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626625/u6rppu1c3yx2k6dcfzxu.png',
        productCount: 32,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Red', 'White', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '5',
          sku: 'PUM-RSX-RED-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630585/ons8fzyawegllp1bh3zx.jpg',
          price: 259.99,
          salePrice: 199.99,
          stock: 6,
          attributes: {'Color': 'Red', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '6',
          sku: 'PUM-RSX-WHT-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748630650/kasdqxl6hjnjnlyukutd.webp',
          price: 259.99,
          salePrice: 199.99,
          stock: 12,
          attributes: {'Color': 'White', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '7',
          sku: 'PUM-RSX-BLK-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631392/rwqij7ymnmoh7k5agxqk.avif',
          price: 259.99,
          salePrice: 199.99,
          stock: 12,
          attributes: {'Color': 'Black', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '4',
      title: 'New Balance 530',
      stock: 21,
      price: 250.99,
      salePrice: 220.99,
      description:
          'The New Balance 530 sneaker is a throwback to one of our classic running looks. This casual shoe combines everyday style with the modern technology of ABZORB cushioning for superior comfort underfoot. Put a 2000 technical spin on your running style with the 530 sneaker.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631051/wqncpuiu9zwtosc7koqy.webp',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631051/wqncpuiu9zwtosc7koqy.webp',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631103/wwkjdc614ipqvcemgzkn.webp',
      ],
      brand: BrandModel(
        id: '4',
        name: 'New Balance',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748628571/r6po72yicitl4c36utvl.png',
        productCount: 38,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Classic Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '8',
          sku: 'NB-530-WHT-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631051/wqncpuiu9zwtosc7koqy.webp',
          price: 279.99,
          salePrice: 229.99,
          stock: 8,
          attributes: {'Color': 'White', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '9',
          sku: 'NB-530-WHT-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748631392/rwqij7ymnmoh7k5agxqk.avif',
          price: 279.99,
          salePrice: 229.99,
          stock: 8,
          attributes: {'Color': 'Black', 'Size': '7'},
        ),
      ],
    ),
    ProductModel(
      id: '9',
      title: 'Reebok Classic Leather',
      stock: 30,
      price: 189.99,
      salePrice: 149.99,
      description:
          'Reebok Classic Leather combines timeless design with modern comfort for a versatile everyday sneaker. The soft leather upper provides durability and support, while the EVA midsole ensures lightweight cushioning for all-day comfort.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658485/n6cnily2vzi5dyir6u1q.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658571/btfieh3mazfg7gd6cndi.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658577/gg99ke7tldn20w5joikj.jpg',
      ],
      brand: BrandModel(
        id: '5',
        name: 'Reebok',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748628714/i5vj4lu7wivi6i0dxwfv.png',
        productCount: 48,
        isFeatured: false,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Black', 'Grey'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '10',
          sku: 'RBK-CL-WHT-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658485/n6cnily2vzi5dyir6u1q.jpg',
          price: 189.99,
          salePrice: 149.99,
          stock: 15,
          attributes: {'Color': 'White', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '11',
          sku: 'RBK-CL-BLK-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658571/btfieh3mazfg7gd6cndi.jpg',
          price: 189.99,
          salePrice: 149.99,
          stock: 15,
          attributes: {'Color': 'Black', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '12',
          sku: 'RBK-CL-GRY-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658577/gg99ke7tldn20w5joikj.jpg',
          price: 189.99,
          salePrice: 149.99,
          stock: 15,
          attributes: {'Color': 'Grey', 'Size': '7'},
        ),
      ],    
    ),
    ProductModel(
      id: '10',
      title: 'Under Armour HOVR Phantom',
      stock: 25,
      price: 299.99,
      salePrice: 249.99,
      description:
          'UA HOVR Phantom offers responsive cushioning and energy return with every step. The compression mesh Energy Web contains and molds UA HOVR foam to give back the energy you put in, while the sock-like fit and knit upper provide ultimate breathability and comfort.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658725/e0vzlxxv96wo9zsysrus.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658783/haxue4narxttt7rmgsya.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658818/f5ufybo9jd6mqfpvulzv.jpg',
      ],
      brand: BrandModel(
        id: '6',
        name: 'Under Armour',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629104/j01oruetevbu7jc1vgaz.png',
        productCount: 32,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Red', 'Grey'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['8', '9', '10', '11', '12'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '13',
          sku: 'UA-HOVR-BLK-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658725/e0vzlxxv96wo9zsysrus.jpg',
          price: 299.99,
          salePrice: 249.99,
          stock: 10,
          attributes: {'Color': 'Black', 'Size': '10'},
        ),
        ProductVariationModel(
          id: '14',
          sku: 'UA-HOVR-RED-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658783/haxue4narxttt7rmgsya.jpg',
          price: 299.99,
          salePrice: 249.99,
          stock: 15,
          attributes: {'Color': 'Red', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '15',
          sku: 'UA-HOVR-GREY-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748658818/f5ufybo9jd6mqfpvulzv.jpg',
          price: 299.99,
          salePrice: 249.99,
          stock: 15,
          attributes: {'Color': 'Grey', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '7',
      title: 'ASICS Gel-Kayano 29',
      stock: 22,
      price: 279.99,
      salePrice: 229.99,
      description:
          'The GEL-KAYANO 29 shoe creates a stable running experience through the FF BLAST PLUS cushioning and the LITETRUSS technology that provides stability and support. The updated design balances a smooth transition with strategic support in the heel and midfoot, providing foot support while improving overall comfort.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659033/u9zqg8zelldwuygynvf7.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659039/wqnzdoedek9jrjesktm5.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659045/ai06iikhnllzwcvmt4xk.jpg',
      ],
      brand: BrandModel(
        id: '7',
        name: 'Asics',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629494/duthp0uhyuobs3zhdklo.png',
        productCount: 18,
        isFeatured: false,
      ),
      isFeatured: false,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black', 'White'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['8', '9', '10', '11', '12'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '16',
          sku: 'ASC-GK29-BLU-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659033/u9zqg8zelldwuygynvf7.jpg',
          price: 279.99,
          salePrice: 229.99,
          stock: 12,
          attributes: {'Color': 'Blue', 'Size': '10'},
        ),
        ProductVariationModel(
          id: '17',
          sku: 'ASC-GK29-BLK-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659039/wqnzdoedek9jrjesktm5.jpg',
          price: 279.99,
          salePrice: 229.99,
          stock: 10,
          attributes: {'Color': 'Black', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '8',
      title: 'Fila Disruptor II',
      stock: 35,
      price: 199.99,
      salePrice: 159.99,
      description:
          'The Fila Disruptor II features a bold, chunky silhouette that has made it an icon of street style. With a premium leather upper, EVA midsole for lightweight cushioning, and a rubber outsole for traction, these sneakers are both fashionable and functional for everyday wear.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659167/w3eyff5zsg3xmirzeoca.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659187/fs8ax3tmlunbsdzfg24c.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659196/goifaeqdq5xvo4geinxw.jpg',
      ],
      brand: BrandModel(
        id: '8',
        name: 'Fila',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629547/jenchgvon7rpx9ogtmty.png',
        productCount: 25,
        isFeatured: false,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Pink', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['6', '7', '8', '9', '10'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '18',
          sku: 'FLA-D2-WHT-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659167/w3eyff5zsg3xmirzeoca.jpg',
          price: 199.99,
          salePrice: 159.99,
          stock: 20,
          attributes: {'Color': 'White', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '19',
          sku: 'FLA-D2-PNK-7',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659187/fs8ax3tmlunbsdzfg24c.jpg',
          price: 199.99,
          salePrice: 159.99,
          stock: 15,
          attributes: {'Color': 'Pink', 'Size': '7'},
        ),
      ],
    ),
    ProductModel(
      id: '11',
      title: 'Nike Air Force 1',
      stock: 32,
      price: 259.99,
      salePrice: 219.99,
      description:
          'The Nike Air Force 1 is a classic basketball shoe that has transcended the court to become a cultural icon. Featuring premium leather, a durable rubber outsole, and Nike Air cushioning for all-day comfort.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659305/ehuujlisd7gzlfmhwnmb.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659344/vu5gwrc4g28vrhod40xy.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659527/xngqheqroi3swe4dtojl.jpg',
      ],
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626622/efijsm6eudooxowqkda4.png',
        productCount: 45,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '20',
          sku: 'NIK-AF1-WHT-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659305/ehuujlisd7gzlfmhwnmb.jpg',
          price: 259.99,
          salePrice: 219.99,
          stock: 18,
          attributes: {'Color': 'White', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '21',
          sku: 'NIK-AF1-RED-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659527/xngqheqroi3swe4dtojl.jpg',
          price: 259.99,
          salePrice: 219.99,
          stock: 14,
          attributes: {'Color': 'Red', 'Size': '10'},
        ),
      ],
    ),
    ProductModel(
      id: '12',
      title: 'Adidas Stan Smith',
      stock: 28,
      price: 219.99,
      salePrice: 189.99,
      description:
          'The Adidas Stan Smith is a timeless tennis shoe that has become a fashion icon. With its clean, minimalist design and premium leather upper, it\'s a versatile addition to any wardrobe.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659611/joxyrot40zhmj1ixemqz.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659654/qvpq3eedife5fmo0w2sg.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659664/xiyhx1k5pl1wdyrps941.jpg',
      ],
      brand: BrandModel(
        id: '2',
        name: 'Adidas',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626611/azbzyct37rwszc1gqesh.png',
        productCount: 38,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White/Green', 'White/Navy', 'All White'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '22',
          sku: 'ADI-SS-WGR-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659611/joxyrot40zhmj1ixemqz.jpg',
          price: 219.99,
          salePrice: 189.99,
          stock: 15,
          attributes: {'Color': 'White/Green', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '23',
          sku: 'ADI-SS-WNV-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659654/qvpq3eedife5fmo0w2sg.jpg',
          price: 219.99,
          salePrice: 189.99,
          stock: 13,
          attributes: {'Color': 'White/Navy', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '13',
      title: 'Puma Suede Classic',
      stock: 24,
      price: 179.99,
      salePrice: 149.99,
      description:
          'The Puma Suede Classic is a legendary sneaker that has been a street style icon since 1968. With its soft suede upper, distinctive formstrip, and rubber outsole, it delivers both style and comfort.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659748/zqw2rzemjwzhh8hmqow3.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659780/eijcs5wgzjytmhvx2s5b.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659787/dp0shikudbecb9tqsadc.jpg',
      ],
      brand: BrandModel(
        id: '3',
        name: 'Puma',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748626625/u6rppu1c3yx2k6dcfzxu.png',
        productCount: 32,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Red', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['7', '8', '9', '10', '11'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '24',
          sku: 'PUM-SC-BLU-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659748/zqw2rzemjwzhh8hmqow3.jpg',
          price: 179.99,
          salePrice: 149.99,
          stock: 12,
          attributes: {'Color': 'Blue', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '25',
          sku: 'PUM-SC-RED-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659780/eijcs5wgzjytmhvx2s5b.jpg',
          price: 179.99,
          salePrice: 149.99,
          stock: 12,
          attributes: {'Color': 'Red', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '14',
      title: 'Reebok Nano X1',
      stock: 25,
      price: 219.99,
      salePrice: 189.99,
      description:
          'The Reebok Nano X1 is the most versatile training shoe, designed for those who train hard and expect their footwear to work just as hard. Features Floatride Energy Foam for lightweight, responsive cushioning and a Flexweave knit upper that provides breathable durability.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659867/uuhfsdipfbnrcmaqtdzs.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659895/wkjx1x7zuowtj8li68cq.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659901/rzqf2iuvucc6urqqt4pz.jpg',
      ],
      brand: BrandModel(
        id: '5',
        name: 'Reebok',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748628714/i5vj4lu7wivi6i0dxwfv.png',
        productCount: 48,
        isFeatured: false,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black/White', 'Blue/Yellow', 'Grey/Neon'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['8', '9', '10', '11', '12'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '26',
          sku: 'RBK-NX1-BWH-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659867/uuhfsdipfbnrcmaqtdzs.jpg',
          price: 219.99,
          salePrice: 189.99,
          stock: 14,
          attributes: {'Color': 'Black/White', 'Size': '10'},
        ),
        ProductVariationModel(
          id: '27',
          sku: 'RBK-NX1-BYL-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748659895/wkjx1x7zuowtj8li68cq.jpg',
          price: 219.99,
          salePrice: 189.99,
          stock: 11,
          attributes: {'Color': 'Blue/Yellow', 'Size': '9'},
        ),
      ],
    ),
    ProductModel(
      id: '15',
      title: 'Under Armour Project Rock 5',
      stock: 18,
      price: 289.99,
      salePrice: 259.99,
      description:
          'Built with Dwayne "The Rock" Johnson, the Project Rock 5 training shoes are designed for intense workouts. These shoes feature responsive UA HOVR™ cushioning, a breathable mesh upper, and durable TPU overlays for added support during even your most grueling training sessions.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660082/llobbjqksaxcrefskpfm.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660087/olwrw1aiuyvtna5zcbt7.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660094/ber0jsbsoswmgnkzbrez.jpg',
      ],
      brand: BrandModel(
        id: '6',
        name: 'Under Armour',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629104/j01oruetevbu7jc1vgaz.png',
        productCount: 32,
        isFeatured: true,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black/Red', 'White/Blue', 'Grey/Yellow'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['8', '9', '10', '11', '12'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '28',
          sku: 'UA-PR5-BRD-11',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660082/llobbjqksaxcrefskpfm.jpg',
          price: 289.99,
          salePrice: 259.99,
          stock: 9,
          attributes: {'Color': 'Black/Red', 'Size': '11'},
        ),
        ProductVariationModel(
          id: '29',
          sku: 'UA-PR5-WBL-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660087/olwrw1aiuyvtna5zcbt7.jpg',
          price: 289.99,
          salePrice: 259.99,
          stock: 9,
          attributes: {'Color': 'White/Blue', 'Size': '10'},
        ),
      ],
    ),
    ProductModel(
      id: '16',
      title: 'ASICS GT-2000 11',
      stock: 30,
      price: 249.99,
      salePrice: 199.99,
      description:
          'The ASICS GT-2000 11 is a reliable, everyday training shoe designed for the stability-seeking runner. Featuring FLYTEFOAM™ Propel technology for a responsive ride and DYNAMIC DUOMAX™ Support System to enhance stability and support, this shoe delivers mile after comfortable mile.',
      thumbnail:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660178/nbla60f4kkjd8veyy4me.jpg',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660201/f7hpa04bawrkq6jgpicw.jpg',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660207/v66ufbswvj2w6agklx9q.jpg',
      ],
      brand: BrandModel(
        id: '7',
        name: 'Asics',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748629494/duthp0uhyuobs3zhdklo.png',
        productCount: 18,
        isFeatured: false,
      ),
      isFeatured: true,
      categoryId: 'shoes',
      productType: 'Physical',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue/Green', 'Black/Silver', 'White/Orange'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['8', '9', '10', '11', '12'],
        ),
      ],
      productVariants: [
        ProductVariationModel(
          id: '30',
          sku: 'ASC-GT11-BGN-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660178/nbla60f4kkjd8veyy4me.jpg',
          price: 249.99,
          salePrice: 199.99,
          stock: 15,
          attributes: {'Color': 'Blue/Green', 'Size': '10'},
        ),
        ProductVariationModel(
          id: '31',
          sku: 'ASC-GT11-BSL-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748660201/f7hpa04bawrkq6jgpicw.jpg',
          price: 249.99,
          salePrice: 199.99,
          stock: 15,
          attributes: {'Color': 'Black/Silver', 'Size': '9'},
        ),
      ],
    ),
  ];
}
