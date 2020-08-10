class ApplicationController < ActionController::Base
  def favorite_text
    return @favorite_exists ? "UnSave Review" : "Save Review"
  end

  helper_method :favorite_text
end
