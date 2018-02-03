require 'rails_helper'

describe "user sees a sigle article" do
  describe "they visit article/id" do
    it "shows article information" do
      article = Article.create!(title: "Article One", body: "This is the first article!")

      visit articles_path
      click_link article.title

      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content("Article One")
      expect(page).to have_content("This is the first article!")
    end
  end
end
