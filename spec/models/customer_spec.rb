require 'rails_helper'

RSpec.describe Customer, 'モデルに関するテスト', type: :model do
  describe '実際に保存してみる' do
    it '有効な内容の場合は保存されるか' do
      expect(FactoryBot.build(:customer)).to be_valid
    end
  end
  context '空白のバリデーションチェック' do
    it 'emailが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:email]).to include('を入力してください')
    end
    it 'passwordが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:password]).to include('を入力してください')
    end
    it 'password_confirmationが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: '', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
    it 'last_nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:last_name]).to include('を入力してください')
    end
    it 'first_nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:first_name]).to include('を入力してください')
    end
    it 'last_name_kanaが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: '', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:last_name_kana]).to include('を入力してください')
    end
    it 'first_name_kanaが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: '', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:first_name_kana]).to include('を入力してください')
    end
    it 'postal_codeが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:postal_code]).to include('を入力してください')
    end
    it 'addressが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:address]).to include('を入力してください')
    end
    it 'telephone_numberが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '')
      expect(customer).to be_invalid
      expect(customer.errors[:telephone_number]).to include('を入力してください')
    end
  end
  context '条件のバリデーションチェック' do
    it 'last_name_kanaがカタカナ以外の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'さが', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:last_name_kana]).to include('は不正な値です')
    end
    it 'first_name_kanaがカタカナ以外の場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'たろう', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:first_name_kana]).to include('は不正な値です')
    end
    it 'postal_codeが7桁でない場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:postal_code]).to include('は不正な値です')
    end
    it 'telephone_numberが10桁・11桁でない場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: 'password', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '00000')
      expect(customer).to be_invalid
      expect(customer.errors[:telephone_number]).to include('は不正な値です')
    end
    it 'password_confirmationが一致しない場合にバリデーションチェックされエラーメッセージが返ってきているか' do
      customer = Customer.new(email: '000@000.com', password: '0000000', password_confirmation: '1111111', last_name: '嵯峨', first_name: '太郎', last_name_kana: 'サガ', first_name_kana: 'タロウ', postal_code: '0000000', address: '京都府京都市', telephone_number: '0000000000')
      expect(customer).to be_invalid
      expect(customer.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
  end
end