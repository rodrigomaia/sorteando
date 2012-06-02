# encoding: UTF-8
require 'spec_helper'

describe Concorrente do
  describe "Validations" do
    it { should validate_presence_of(:nome).with_message(/é um campo obrigatório/) }
  end
end