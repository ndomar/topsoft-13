class PostsController < ApplicationController
 #  def delete
 #    @post = Post.find(params[:id])
 #  end
  
 #  def destroy
 #    Post.find(params[:id]).destroy
 #    redirect_to(:action => 'list')
 #  end

 #    def list 
	# @post = Post.all
 #    end

 	# Riham Gamal 22-3871
 	# add a new post 
	def newPost
		@group_id = params[:id]
		@post = Post.new
	end

	#Author Riham Gamal 22-3871
	# create a new post
	def createPost
		@post = Post.new(params[:post])

		#Author Riham Gamal 22-3871
		# if the post is saved, 
		if @post.save
			flash[:notice] = "Post successfully created"
			redirect_to(:action => 'newPost')
		#Author Riham Gamal 22-3871
		# if the post is not saved, 
		else
			flash[:notice] = "Post could not be created"
			render('newPost')
		end

	end


	# Riham Gamal 22-3871, Mariam Ismail 22-3456
	# find the post you want to edit
	# takes the group id

	def editPost	
	    @group_id = params[:group_id]
	    @post_id=params[:id]
		@post = Post.find(params[:id])
		
end

	
	# Riham Gamal 22-3871, Mariam Ismail 22-3456
	# update the post by finding its id and changing the fields
	# takes the group-id and redirects back to show group


	def updatePost
		 @post = Post.find(params[:post_id])
		 @group_id = params[:group_id]
	    @post_id=params[:post_id]
        
		if @post.update_attributes(params[:post])

			flash[:notice] = "Post successfully updated"
			redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
		else

			flash[:notice] = "Post could not be updated"
			 
			redirect_to(:action => 'editPost',:post_id =>@post_id, :group_id =>@group_id)
		end


	end
	# # add a new post 
	# def newPost
	# 	@post = Post.new
	# end

	# Salma El Ruby 22-4649
	# deletes posts
	  def delete
	    @post = Post.find(params[:id])
	  end
	  
	  def destroy
	    Post.find(params[:id]).destroy
	    redirect_to(:action => 'list')
	  end

		# Salma El Ruby 22-4649
		# displays all available posts 
	    def list 
		@post = Post.all
	    end

		

end
