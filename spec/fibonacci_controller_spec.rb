require 'rails_helper'

RSpec.describe FibonacciController, type: :controller do
  describe 'GET #index' do
    context '入力が正しい値の時' do
      it 'n=10の時正しい値を返す' do
        get :index, params: { n: 10 }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['result']).to eq(55)
      end

      it 'n=40の時正しい値を返す' do
        get :index, params: { n: 40 }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['result']).to eq(102334155)
      end
    end

    context '入力が不正な値の時' do
      it 'n=0の時、400を返す ' do
        get :index, params: { n: 0 }
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)['message']).to eq('Bad request.')
      end

      it 'nが負の値の時、400を返す' do
        get :index, params: { n: -5 }
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)['message']).to eq('Bad request.')
      end

      it 'nが数値できない時、400を返す' do
        get :index, params: { n: 'a' }
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)['message']).to eq('Bad request.')
      end
    end
  end
end

