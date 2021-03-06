require 'rails_helper'


RSpec.describe ModelLabel, type: :config do
  before :context do
    class ModelLabelConfigCourse
      include Mongoid::Document
      include Mongoid::Timestamps
    end

    class ModelLabelConfigQuestion
      include Mongoid::Document
      include Mongoid::Timestamps
    end

    ModelLabel.set_config({
      "课程"   => ModelLabelConfigCourse,
      "测试题" => ModelLabelConfigQuestion
    })
  end

  it{
    expect(ModelLabel.get_model_names).to include("课程", "测试题")
  }

  it{
    expect(ModelLabel.get_models).to include(ModelLabelConfigCourse, ModelLabelConfigQuestion)
  }

  it{
    expect(ModelLabel.get_model_by_name("课程")).to eq(ModelLabelConfigCourse)
  }

  it{
    expect(ModelLabel.get_model_by_name("测试题")).to eq(ModelLabelConfigQuestion)
  }

  it{
    expect(ModelLabel.get_name_by_model(ModelLabelConfigCourse)).to eq("课程")
  }

  it{
    expect(ModelLabel.get_name_by_model(ModelLabelConfigQuestion)).to eq("测试题")
  }
end
