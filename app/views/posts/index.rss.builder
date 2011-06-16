xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "NathanielBarnes.com"
    xml.description "All Blog Posts"
    xml.link posts_path(:rss)
    
    for article in @posts
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link post_path(article)
        xml.guid post_path(article)
      end
    end
  end
end