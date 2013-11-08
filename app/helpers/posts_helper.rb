module PostsHelper
	def get_tags(post_param, tag_num)
	  post = post_param
      content = ""
      content << "<div style='float:left;margin-right: 5px;'>"
      content << "<i class='icon-tags'></i>"
      content << "</div>"
      i = 0
      post.tag_ids.each do |tag_id|
        content << "<div style='float:left;'>"
        content << "<a href=" + posts_path(tag: tag_id)
        content << "><button class='btn btn-info'>"
        content << Tag.find(tag_id).name
        content << "</button></a></div>"
        i+=1; 
        break if tag_num >0 && i>=tag_num
      end
        content <<= post.tag_ids.length > tag_num ? "</div>..." : "</div>"
	end
end
