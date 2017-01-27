module Admin
  class BlogPostsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end
    def update
      params_tags = params[:blog_post].delete :tag_list
      params_category = params[:blog_post].delete :category
      category = Category.find_by_title(params_category)
      if requested_resource.update(resource_params)
        db_tags = requested_resource.tag_list
        add_tags = params_tags - db_tags
        remove_tag = db_tags - params_tags
        requested_resource.tag_list.add(add_tags)
        requested_resource.tag_list.remove(remove_tag)
        requested_resource.update_attributes!(friend_url: params[:blog_post][:friend_url], slug: nil, category_id: category.id)
        redirect_to(
          admin_posts_path,
          notice: "#{requested_resource.title}更新成功",
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    def create
      tag_lists = params[:blog_post].delete :tag_list
      params_category = params[:blog_post].delete :category
      category = Category.find_by_title(params_category)
      resource = resource_class.new(resource_params)
      resource.tag_list.add(tag_lists)
      resource.category = category
      if resource.save
        redirect_to(
          admin_posts_path,
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
     end
   end

   def find_resource(param)
      resource_class.find_by_slug(param)
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def resource_params
      params.require(:blog_post).permit(:title, :content, :tag_list, :friend_url, :book_cover_url, :category)
    end

  end
end
