user = User.create!(email: 'liulei@mail.com', password: '12345678', password_confirmation: '12345678')

shop = user.create_shop(name: 'GoodShop')
category = Category.create(name: '奶粉')
product = category.products.create(name: 'Mead Johnson/美赞臣')

property = category.properties.create(name: '包装')
product.product_properties.create(property_item_id: property.property_items.create(name: '袋装').id)
product.product_properties.create(property_item_id: property.property_items.create(name: '盒装').id)
product.product_properties.create(property_item_id: property.property_items.create(name: '灌装').id)

stock_property = category.stock_properties.create(name: '段数')
stock_property.stock_property_items.create(name: '一段')
stock_property.stock_property_items.create(name: '二段')
stock_property.stock_property_items.create(name: '三段')
stock_property.stock_property_items.create(name: '四段')
stock_property.stock_property_items.create(name: '特殊配方')
stock_property.stock_property_items.create(name: '其他')