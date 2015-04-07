require 'spec_helper'
require 'json'

name  = 'test_name'
value = 'test_value'
desc  = 'test_description'

describe CFN::Output do
  let(:output_instance) do
    block = Proc.new do
      value value
      description desc
    end
    CFN::Output.new(name, &block)
  end

  # let(:output_func) do
  #   # binding.pry
  #   block = Proc.new do
  #     value value
  #     description desc
  #   end
  #   output(name, &block)
  # end

  # describe "output function" do
  #   it "returns CFN::Output object" do
  #     expect(output_func).to be_an_instance_of(CFN::Output)
  #   end
  # end

  describe "object" do
    it "has 'CFN::Output' object type" do
      expect(output_instance).to be_an_instance_of(CFN::Output)
    end

    it "has to_s method" do
      expect(output_instance).to respond_to('to_s')
    end

    it "contains name in string representation" do
      expect(output_instance.to_s).to include(name)
    end

    it "contains value in string representation" do
      expect(output_instance.to_s).to include(value)
    end

    it "contains description in string representation" do
      expect(output_instance.to_s).to include(desc)
    end

    it "has to_json method" do
      expect(output_instance).to respond_to('to_json')
    end

    it "has valid JSON representation" do
      json_string = output_instance.to_json
      expect { JSON.parse json_string }.not_to raise_error
    end

    it "json representation has name value" do
      json_string = output_instance.to_json
      data = JSON.parse json_string
      expect(data).to have_key(name)
    end
  end
end
