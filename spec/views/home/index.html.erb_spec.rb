require 'rails_helper'

RSpec.describe 'home/index.html.erb' do
  before do
    render
  end

  it 'rendered can not be empty' do
    expect(rendered.length).to be > 0
  end
end
