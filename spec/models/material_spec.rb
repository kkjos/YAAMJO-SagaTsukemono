require 'rails_helper'

RSpec.describe Material, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:material)).to be_valid
    end
    context "空白のバリデーションチェック" do
      it "nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
        material = Material.new(name: '')
        expect(material).to be_invalid
        expect(material.errors[:name]).to include("を入力してください")
      end
    end
  end
  describe '原菜登録' do
    before do
      @material = FactoryBot.build(:material)
    end
    it '同じ原菜は登録できないこと' do
      @material.save
      another_material = FactoryBot.build(:material)
      another_material.name = @material.name
      another_material.valid?
      expect(another_material.errors[:name]).to include("はすでに存在します")
    end
  end
end