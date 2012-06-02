require "spec_helper"

describe "sorteios/index" do
  it "mostrar titulo Sorteios" do
    assign :sorteios, []
    render
    rendered.should have_content("Sorteios")
  end

  it "mostrar listagem de sorteios" do
    assign :sorteios, [ FactoryGirl.build(:sorteio, :id => '1', :nome => 'mega sena da virada') ]
    render
    rendered.should have_selector("tr > td") do |td|
      td.should have_content('mega sena da virada')
    end
  end
end