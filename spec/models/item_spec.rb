RSpec.describe Item, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合は保存されるか" do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/top1.png')
    end
  end
  context "空白のバリデーションチェック" do
    image_id = 'fixture_file_upload { "app/assets/images/top1.png" }'
    it "nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      item = Item.new(name: '', introduction:'美味しい', capacity:'100g', price: '1000')
      expect(item).to be_invalid
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "introductionが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      item = Item.new(name: '手切り大根', introduction:'', capacity:'100g', price: '1000')
      expect(item).to be_invalid
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    it "capacityが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      item = Item.new(name: '手切り大根', introduction:'美味しい', capacity:'', price: '1000')
      expect(item).to be_invalid
      expect(item.errors[:capacity]).to include("を入力してください")
    end
    it "priceが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      item = Item.new(name: '手切り大根', introduction:'美味しい', capacity:'100g', price: '')
      expect(item).to be_invalid
      expect(item.errors[:price]).to include("を入力してください")
    end
  end
end