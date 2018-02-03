require 'rails_helper'

describe "user sees a sigle article" do
  describe "they visit article/id" do
    it "shows article information" do
      article = Article.create!(title: "Article One", body: "This is the first article!")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")

      visit articles_path
      click_link article.title

      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content("Article One")
      expect(page).to have_content("This is the first article!")
      expect(page).to have_content("Me")
      expect(page).to have_content("You")
      expect(page).to have_content("Commenty comments")
      expect(page).to have_content("So much to say")

    end
  end
end
