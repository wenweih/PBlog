class FileAttachController < ApplicationController

  def post_image
    file = params[:upload_file]
    file_list = []
    success = true
    msg = '上传成功'
    file_real_path = ''

    if !file.content_type.match(/^image\/(gif|png||jpg||jpeg|){1}$/)
      success = false
      msg = "#{file.original_filename}:只支持上传JPG,JPEG,PNG格式图片"
    elsif file.size > 2*1024*1024
      success = false
      msg = "#{file.original_filename}:图片太大，请上传小于2M的图片"
    end
    if success
      file_real_path = save_file(file)
      file_list << file_real_path
    end
    logger.info file_real_path
    render json: {:success=>success, :msg=>msg,:file_path=>"/#{file_real_path}" }
  end

  private

  def save_file(file)
    extname = file.content_type.match(/^image\/(gif|png|jpg|jpeg){1}$/).to_a[1]
    filename = File.basename(file.original_filename,'.*')
    uri = File.join('uploads','images',"#{DateTime.now.strftime('%Y/%m%d/%H%M%S')}_#{SecureRandom.hex(4)}_#{current_user.id}.#{extname}")
    save_path = Rails.root.join('public',uri)
    file_dir = File.dirname(save_path)

    FileUtils.mkdir_p(file_dir) unless Dir.exists?(file_dir)
    File.open save_path, 'wb' do |f|
      f.write(file.read)
    end
    return uri
  end
end
