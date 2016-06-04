module Admin
  class TweetsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end
    def update
      if requested_resource.update(resource_params)
        redirect_to(
          admin_tweets_path,
          notice: "#{requested_resource.content}更新成功",
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
        redirect_to(
          admin_tweets_path,
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
     end
   end

   def find_resource(param)
     resource_class.find(param)
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def resource_params
      params.require(:tweet).permit(:content)
    end

  end
end
