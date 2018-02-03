require "rails_helper"

describe "user seels all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit '/articles'

      expect(page).to have_link("Title 1")
      expect(page).to have_link("Title 2")
      expect(page).to have_link("New Article")
    end
  end
end
