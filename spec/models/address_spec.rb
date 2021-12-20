require 'rails_helper'

RSpec.describe Address, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:address)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      address = Address.new(name: '', postal_code:'0000000', address:'000@000.com')
      expect(address).to be_invalid
      expect(address.errors[:name]).to include("を入力してください")
    end
    it "postal_codeが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      address = Address.new(name: '', postal_code:'', address:'京都府京都市')
      expect(address).to be_invalid
      expect(address.errors[:postal_code]).to include("を入力してください")
    end
    it "addressが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      address = Address.new(name: '嵯峨太郎', postal_code:'0000000', address:'')
      expect(address).to be_invalid
      expect(address.errors[:address]).to include("を入力してください")
    end
  end
  context "条件のバリデーションチェック" do
    it "postal_codeが7桁でない場合にバリデーションチェックされエラーメッセージが返ってきているか" do
    address = Address.new(name: '嵯峨太郎', postal_code:'00000', address:'京都府京都市')
    expect(address).to be_invalid
    expect(address.errors[:postal_code]).to include("は不正な値です")
    end
  end
end