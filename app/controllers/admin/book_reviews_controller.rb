module Admin
  class BookReviewsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end
    def update
      if requested_resource.update(resource_params)
        requested_resource.update_attribute(params[:friend_url]) if requested_resource.friend_url_changed?
        requested_resource.tag_list.add(params[:tag_list]) if params[:tag_list]
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
      resource = resource_class.new(resource_params)
      if resource.save
        requested_resource.tag_list.add(params[:tag_list]) if params[:tag_list]
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
      params.require(:book_review).permit(:title, :content, :tag_list, :friend_url, :book_cover_url)
    end

  end
end
