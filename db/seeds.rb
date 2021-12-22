# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create!(
  { email: 'admin@admin.com', password: 'adminadmin' }
)

# 原菜
Material.create!(
  [
    { name: '大根' },
    { name: '小松菜' },
    { name: '長芋' },
    { name: '菜の花' },
    { name: 'キャベツ' },
    { name: 'トマト' },
    { name: '蕪' },
    { name: 'その他' }
  ]
)

# 商品
Item.create!(
  [
    {
      material_id: '1',
      name: '手切り大根',
      image: File.open('./app/assets/images/item1.png'),
      introduction: '嵯峨漬物やまじょう名物の逸品です。他にはない独特の歯応えや水尾乃柚子の風味と豊かな香りが特徴です。',
      capacity: '150g',
      price: '500',
      is_active: 'true'
    },
    {
      material_id: '2',
      name: '嵯峨小松菜',
      image: File.open('./app/assets/images/item2.png'),
      introduction: '地元の契約農家から厳選された朝採りの小松菜を使用しています。しっかりとした歯ごたえでビタミン豊富で栄養価の高い商品です。',
      capacity: '160g',
      price: '450',
      is_active: 'true'
    },
    {
      material_id: '3',
      name: '長芋',
      image: File.open('./app/assets/images/item3.png'),
      introduction: '長芋特有のネバリを生かし、シャキシャキした食感を大切に仕上げました。さっぱりとした醤油味と水尾乃柚子の相性は抜群です。',
      capacity: '150g',
      price: '500',
      is_active: 'true'
    },
    {
      material_id: '4',
      name: '菜の花',
      image: File.open('./app/assets/images/item4.png'),
      introduction: '春限定。地元嵯峨で採れた菜の花にこだわり春の時期にしか味わえない味と香りをお楽しみください。',
      capacity: '65g',
      price: '450',
      is_active: 'false'
    },
    {
      material_id: '5',
      name: '春キャベツ',
      image: File.open('./app/assets/images/item5.png'),
      introduction: '春限定。朝採りした春キャベツを新鮮な内に漬け込むことで、やわらかく鮮やかな仕上がります。春の香りを感じてください。',
      capacity: 'キャベツ4分の1',
      price: '400',
      is_active: 'false'
    },
    {
      material_id: '6',
      name: 'とまと',
      image: File.open('./app/assets/images/item6.png'),
      introduction: '夏季限定。トマトの品質や大きさにこだわり一番おいしい時期にのみの販売しております。サラダのような感覚で、女性を中心ご好評いただいている商品です。',
      capacity: '1個',
      price: '500',
      is_active: 'false'
    },
    {
      material_id: '7',
      name: '柚子千枚',
      image: File.open('./app/assets/images/item7.png'),
      introduction: '11月~2月。京都特産、聖護院かぶらを薄くかき（削り）北海道産の上質な昆布と水尾乃柚子でひとつひとつ丁寧に仕上げました。京都の冬を代表するお漬物です。',
      capacity: '120g',
      price: '700',
      is_active: 'true'
    },
    {
      material_id: '7',
      name: '赤蕪',
      image: File.open('./app/assets/images/item8.png'),
      introduction: '赤かぶら特有のうま味と彩りを損なわないよう繊細に漬け込みました。まろやかな甘酢の昆布味に仕上げました。',
      capacity: '半割1個',
      price: '500',
      is_active: 'true'
    },
    {
      material_id: '7',
      name: 'ハイカラ漬け',
      image: File.open('./app/assets/images/item9.png'),
      introduction: '11月~2月。京都の聖護院かぶらを使用しております。やわらかく漬け込むためにひとつひとつ切れ目を入れ、さっぱりとした昆布漬で仕上げた逸品です。',
      capacity: '半割1個',
      price: '600',
      is_active: 'true'
    },
    {
      material_id: '8',
      name: 'おかず柚子みそ/金山寺柚子みそ',
      image: File.open('./app/assets/images/item10.png'),
      introduction: '柚子みそはそのままご飯のお供にも生麩や茄子の田楽として、金山寺柚子みそはおつまみや炒め物調味料としてもお使いいただけます。',
      capacity: '120g/200g',
      price: '500',
      is_active: 'true'
    },
    {
      material_id: '8',
      name: '柚子ちりめん/昆布ちりめん',
      image: File.open('./app/assets/images/item11.png'),
      introduction: 'ちりめんは厳選された素材で炊き上げた他では味わうことのできない自慢の逸品です。極上の味をお楽しみください。',
      capacity: '40g',
      price: '600',
      is_active: 'true'
    }
  ]
)

# 会員
10.times do |n|
  person = Gimei.new
  Customer.create!(
    [
      {
        email: "test#{n + 1}@test.com",
        password: '111111',
        password_confirmation: '111111',
        last_name: person.last.kanji,
        first_name: person.first.kanji,
        last_name_kana: person.last.katakana,
        first_name_kana: person.first.katakana,
        postal_code: Faker::Number.number(digits: 7),
        address: Faker::Internet.email,
        telephone_number: Faker::Number.number(digits: 10)
      }
    ]
  )
end

# 注文サンプル１ 全10
Order.create!(
  [
    {
      customer_id: '1',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '1826',
      created_at: '2021-11-29 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '1',
      item_id: '1',
      price: '500',
      amount: '1',
      created_at: '2021-11-29 08:09:33'
    },
    {
      order_id: '1',
      item_id: '2',
      price: '450',
      amount: '1',
      created_at: '2021-11-29 08:09:33'
    }
  ]
)
# 注文サンプル２
Order.create!(
  [
    {
      customer_id: '2',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '5444',
      created_at: '2021-12-16 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '2',
      item_id: '3',
      price: '500',
      amount: '5',
      created_at: '2021-12-16 08:09:33'
    },
    {
      order_id: '2',
      item_id: '4',
      price: '450',
      amount: '4',
      created_at: '2021-12-16 08:09:33'
    }
  ]
)
# 注文サンプル3
Order.create!(
  [
    {
      customer_id: '3',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '4256',
      created_at: '2021-12-17 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '3',
      item_id: '5',
      price: '400',
      amount: '3',
      created_at: '2021-12-17 08:09:33'
    },
    {
      order_id: '3',
      item_id: '6',
      price: '500',
      amount: '4',
      created_at: '2021-12-17 08:09:33'
    }
  ]
)
# 注文サンプル4
Order.create!(
  [
    {
      customer_id: '4',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '5228',
      created_at: '2021-12-18 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '4',
      item_id: '7',
      price: '700',
      amount: '3',
      created_at: '2021-12-18 08:09:33'
    },
    {
      order_id: '4',
      item_id: '8',
      price: '500',
      amount: '4',
      created_at: '2021-12-18 08:09:33'
    }
  ]
)
# 注文サンプル5
Order.create!(
  [
    {
      customer_id: '5',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '6200',
      created_at: '2021-12-18 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '5',
      item_id: '9',
      price: '600',
      amount: '5',
      created_at: '2021-12-18 08:09:33'
    },
    {
      order_id: '5',
      item_id: '10',
      price: '500',
      amount: '4',
      created_at: '2021-12-18 08:09:33'
    }
  ]
)
# 注文サンプル6
Order.create!(
  [
    {
      customer_id: '6',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '1826',
      created_at: '2021-12-19 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '6',
      item_id: '1',
      price: '500',
      amount: '1',
      created_at: '2021-12-19 08:09:33'
    },
    {
      order_id: '6',
      item_id: '2',
      price: '450',
      amount: '1',
      created_at: '2021-12-19 08:09:33'
    }
  ]
)
# 注文サンプル7
Order.create!(
  [
    {
      customer_id: '1',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '5444',
      created_at: '2021-12-19 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '7',
      item_id: '3',
      price: '500',
      amount: '5',
      created_at: '2021-12-20 08:09:33'
    },
    {
      order_id: '7',
      item_id: '4',
      price: '450',
      amount: '4',
      created_at: '2021-12-20 08:09:33'
    }
  ]
)
# 注文サンプル8
Order.create!(
  [
    {
      customer_id: '1',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '4256',
      created_at: '2021-12-20 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '8',
      item_id: '5',
      price: '400',
      amount: '3',
      created_at: '2021-12-20 08:09:33'
    },
    {
      order_id: '8',
      item_id: '6',
      price: '500',
      amount: '4',
      created_at: '2021-12-20 08:09:33'
    }
  ]
)
# 注文サンプル9
Order.create!(
  [
    {
      customer_id: '2',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '5228',
      created_at: '2021-12-21 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '9',
      item_id: '7',
      price: '700',
      amount: '3',
      created_at: '2021-12-21 08:09:33'
    },
    {
      order_id: '9',
      item_id: '8',
      price: '500',
      amount: '4',
      created_at: '2021-12-21 08:09:33'
    }
  ]
)
# 注文サンプル10
Order.create!(
  [
    {
      customer_id: '1',
      postal_code: Faker::Number.number(digits: 7),
      address: Faker::Internet.email,
      name: Faker::Name.name,
      shipping_cost: '800',
      total_payment: '6200',
      created_at: '2021-12-21 08:09:33'
    }
  ]
)
OrderDetail.create!(
  [
    {
      order_id: '10',
      item_id: '9',
      price: '600',
      amount: '5',
      created_at: '2021-12-21 08:09:33'
    },
    {
      order_id: '10',
      item_id: '10',
      price: '500',
      amount: '4',
      created_at: '2021-12-21 08:09:33'
    }
  ]
)