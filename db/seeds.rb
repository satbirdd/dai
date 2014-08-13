user = User.first

shop = user.create_shop(name: 'GoodShop')
category = Category.create(name: '奶粉')

property_1 = category.properties.create(name: '段数')
property_2 = category.properties.create(name: '包装')

stock_property_1 = category.stock_properties.create(name: '颜色')

product = Product.create(name: 'Mead Johnson/美赞臣')

# item = shop.items.create(product_id: product.id)