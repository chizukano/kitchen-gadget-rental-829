module ImageHelper
  def omni_image_tag(resource, options = {})
    if resource.attached?
      cl_image_tag resource.key, options
    else
      image_tag omni_image_path(resource, options)
    end
  end

  def omni_image_path(resource, options = {})
    if resource.attached?
      cl_image_path resource.key, options
    else
      image_path "http://place-hold.it/#{options[:width]}x#{options[:height]}?text=No Image", options
    end
  end
end
