require 'spec_helper'

describe Zombie do
	it "should have a name" do
		subject.name = "Ash"
		subject.name.should == "Ash"
	end

	it "should have a graveyard" do
		subject.graveyard = 'Silicon Valley'
		subject.graveyard.should == "Silicon Valley"
	end

	it "should validate that the name is present" do
		subject.should_not be_valid
		subject.errors[:name].first.should == "can't be blank"
		subject.name = "Phuong"
		subject.should be_valid
	end

	it "should validate that the name is unique" do
		subject.name = "Phuong"
		subject.save!
		another_zombie = Zombie.new(:name=>"Ash")
		another_zombie.should_not be_valid
		another_zombie.errors[:name].first.should == "has already been taken"
		another_zombie.name = "Nate"
		another_zombie.should be_valid
	end
end
