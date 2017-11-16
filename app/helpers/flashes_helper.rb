module FlashesHelper
  FLASHES_CLASS = { :notice => "success", :warning => "warning", :alert => "danger"}

  def flashes_class(key)
    FLASHES_CLASS.fetch(key.to_sym, key)
  end

  def user_facing_flashes
    flash.to_hash.slice("notice", "warning", "alert").freeze
  end

end
