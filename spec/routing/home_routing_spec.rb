require 'rails_helper'

RSpec.describe 'HomeController' do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/home/index').to route_to('home#index')
    end
  end
end
