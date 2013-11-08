module CommentsHelper
      
	#function  : comment_form validation errors output
      #parameters: Comment, attribution of Comment
      #return    : a icon and error string in html
      def error_output(comment_para, attri_name)
	  comment = Comment.new
	  comment = comment_para
	  errors = comment.errors[:"#{attri_name}"]
      if errors.presence
      	 content = ""
      	 errors.length.times do |i|
      	   content << "<span class='CF_error_msg'>"
      	   content << "#{image_tag('error.png', size: '15x15', alt: 'error_icon')} "
      	   content << "#{errors[i]}</span><br>"
      	 end
      	 content
      end
    end
end
