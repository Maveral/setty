class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  def math_captcha
    @symbols_tab = ["*", "/", "+", "-"]
    @symbol = @symbols_tab[rand(4)]
    @numbers = []
    4.times do |x| @numbers << 1 + rand(9) end
    @fraction1 = @numbers[0] / @numbers[1].to_f
    @fraction2 = @numbers[2] / @numbers[3].to_f
    
    if @symbol == "*"
      session[:captcha_result] = (@fraction1 * @fraction2).round(2)
    elsif @symbol == "/"
      session[:captcha_result] = (@fraction1 / @fraction2).round(2)
    elsif @symbol == "+"
      session[:captcha_result] = (@fraction1 + @fraction2).round(2)
    else
      session[:captcha_result] = (@fraction1 - @fraction2).round(2)
    end

  end
end