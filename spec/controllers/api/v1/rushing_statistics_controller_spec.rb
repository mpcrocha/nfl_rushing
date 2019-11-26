# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RushingStatisticsController, type: :request do
  subject do
    get '/api/v1/rushing_statistics', params: params
    response
  end

  describe '#index' do
    context 'when an error occurs' do
      let(:params) { { sort: 'ln' } }

      before do
        allow(Rushing).to receive(:where).and_raise(StandardError)
        subject
      end

      it { expect(response.status).to eq(422) }
    end

    describe 'filter by name' do
      before do
        create(:rushing, player: 'Corey Brown', lng: '7')
        create(:rushing, player: 'Corey Shepard', lng: '8')
        create(:rushing, player: 'Bryce Petty', lng: '9')
        subject
      end

      context 'when results are filtered by full player name' do
        let(:player) { 'Corey Brown' }
        let(:params) { { player: player } }
        let(:headers) {}

        it 'results filtered by full player name' do
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['data'].size).to eq(1)
          expect(parsed_body['data'][0]['attributes']['player']).to eq(player)
          expect(response.status).to eq(200)
        end
      end

      context 'when results are filtered by partial player name' do
        let(:partial_player_name) { 'Corey' }
        let(:params) { { player: partial_player_name } }
        let(:headers) {}

        it 'results sorted by partial player name' do
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['data'].size).to eq(2)
          expect(parsed_body['data'][0]['attributes']['player']).to eq('Corey Brown')
          expect(parsed_body['data'][1]['attributes']['player']).to eq('Corey Shepard')
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'one attribute ordering' do
      before do
        create(:rushing, player: 'Corey Brown', lng: '7')
        create(:rushing, player: 'Corey Shepard', lng: '8')
        create(:rushing, player: 'Bryce Petty', lng: '9')
        subject
      end

      context 'when results are sorted by lng in asc order' do
        let(:params) { { sort: 'lng' } }

        it 'results sorted by lng' do
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['data'][0]['attributes']['lng']).to eq('7')
          expect(parsed_body['data'][1]['attributes']['lng']).to eq('8')
          expect(parsed_body['data'][2]['attributes']['lng']).to eq('9')
          expect(response.status).to eq(200)
        end
      end

      context 'when results are sorted by lng in desc order' do
        let(:params) { { sort: '-lng' } }
        let(:headers) {}

        it 'results sorted by -lng' do
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['data'][0]['attributes']['lng']).to eq('9')
          expect(parsed_body['data'][1]['attributes']['lng']).to eq('8')
          expect(parsed_body['data'][2]['attributes']['lng']).to eq('7')
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'two attribute ordering' do
      context 'when results are sorted by lng in desc order and td in asc order' do
        before do
          Rushing.delete_all
          create(:rushing, player: 'John Brown', lng: '8', td: 7)
          create(:rushing, player: 'Corey Shepard', lng: '9', td: 7)
          create(:rushing, player: 'Bryce Petty', lng: '9', td: 8)
          subject
        end

        let(:params) { { sort: '-lng,td' } }

        it 'results sorted by -lng and td' do
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['data'].size).to eq(3)
          expect(parsed_body['data'][0]['attributes']['lng']).to eq('9')
          expect(parsed_body['data'][0]['attributes']['td']).to eq(7)
          expect(parsed_body['data'][0]['attributes']['player']).to eq('Corey Shepard')
          expect(parsed_body['data'][1]['attributes']['lng']).to eq('9')
          expect(parsed_body['data'][1]['attributes']['td']).to eq(8)
          expect(parsed_body['data'][1]['attributes']['player']).to eq('Bryce Petty')
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
