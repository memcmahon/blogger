require 'rails_helper'

describe "user can edit an article" do
  describe "they visit article/id" do
    it "has a link to edit the article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article_1)
      click_link "Edit"

      expect(current_path).to eq edit_article_path(article_1)
    end
  end

  describe "they visit article/id/edit" do
    it "edits the existing article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit edit_article_path(article_1)

      fill_in "article[title]", with: "Edited Title!"
      fill_in "article[body]", with: "Edited Body!"
      click_on "Update Article"

      expect(page).to have_content("Article 'Edited Title!' Updated!")

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("Edited Title!")
      expect(page).to have_content("Edited Body!")
    end
  end
end
