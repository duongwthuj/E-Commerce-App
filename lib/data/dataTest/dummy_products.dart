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
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/nike-air-max-270.png',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/nike-air-max-270-1.png',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/nike-air-max-270-2.png',
      ],
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/brands/nike.png',
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
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/nike-air-max-270-black.png',
          price: 299.99,
          salePrice: 249.99,
          stock: 5,
          attributes: {'Color': 'Black', 'Size': '7'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'NIK-AM270-WHT-8',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/nike-air-max-270-white.png',
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
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/adidas-ultraboost-22.png',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/adidas-ultraboost-22-1.png',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/adidas-ultraboost-22-2.png',
      ],
      brand: BrandModel(
        id: '2',
        name: 'Adidas',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/brands/adidas.png',
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
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/adidas-ultraboost-22-blue.png',
          price: 279.99,
          salePrice: 229.99,
          stock: 8,
          attributes: {'Color': 'Blue', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '4',
          sku: 'ADI-UB22-GRY-10',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/adidas-ultraboost-22-grey.png',
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
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/puma-rs-x.png',
      images: [
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/puma-rs-x-1.png',
        'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/puma-rs-x-2.png',
      ],
      brand: BrandModel(
        id: '3',
        name: 'Puma',
        image:
            'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/brands/puma.png',
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
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/puma-rs-x-red.png',
          price: 259.99,
          salePrice: 199.99,
          stock: 6,
          attributes: {'Color': 'Red', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '6',
          sku: 'PUM-RSX-WHT-9',
          image:
              'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/products/puma-rs-x-white.png',
          price: 259.99,
          salePrice: 199.99,
          stock: 12,
          attributes: {'Color': 'White', 'Size': '9'},
        ),
      ],
    ),
  ];
}
