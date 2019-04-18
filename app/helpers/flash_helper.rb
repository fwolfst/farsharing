module FlashHelper
  def add_flash kv={}, notice: nil, warning: nil, success: nil, failure: nil, info: nil
    flash_adds = {notice: notice, warning: warning,
     success: success, failure: failure,
     info: info}.select {|mt,m| !m.blank?}

    flash_adds.each do |message_type, message|
      if !flash[message_type.to_sym]&.include?(message)
        (flash[message_type.to_sym] ||= []) << message
      end
    end

    if !kv.empty?
      kv.each do |message_type, message|
        if message.to_s != '' && !flash[message_type.to_sym]&.include?(message)
          (flash[message_type.to_sym] ||= []) << message
        end
      end
    end
  end
end
