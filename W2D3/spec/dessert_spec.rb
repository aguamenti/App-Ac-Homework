require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new('brownie', 11, chef)}
  let(:chef) { double("chef", name: "Fred") } #ask about this!!!

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(11)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('cake', 'quantity', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient('flour')).to eq(['flour'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "eggs", "veggie oil", "cocoa powder"]

      ingredients.each do |ing|
        dessert.add_ingredient(ing)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(6)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(15)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Fred the Great Baker")
      expect(dessert.serve).to eq("Chef Fred the Great Baker has made 11 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
