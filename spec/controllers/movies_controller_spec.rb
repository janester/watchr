require 'spec_helper'

describe MoviesController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'trailer'" do
    it "returns http success" do
      get 'trailer'
      response.should be_success
    end
  end

end
