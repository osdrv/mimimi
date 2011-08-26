# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Mimimi" do
  context "missing method" do
    it "should return nil value" do
      Mimimi.some_unknown_method.should be_nil
    end
  end


  context "yap!" do
    it "empty before yap! call" do
      Mimimi.test.should be_nil
    end

    it "returns test structure" do
      Mimimi.yap!
      Mimimi.test.should_not be_nil
      t = Mimimi.test
      t.some_array.is_a?(Array).should be_true
      t.some_array.length.should eq 3
      t.some_hash.is_a?(Hash).should be_true
      t.some_hash["key1"].is_a?(Array).should be_true
      t.some_hash["key1"].length.should eq 4
      t.some_hash["key2"].is_a?(String).should be_true
      t.some_hash["key2"].should eq "just a string"
    end
  end
end
