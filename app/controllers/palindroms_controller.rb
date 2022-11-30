# frozen_string_literal: true

# Palindroms controller
class PalindromsController < ApplicationController
  before_action :autorize, only: %i[result index]
  
  def index; end

  def result
    @number = params[:num].to_i
    @res_arr = PalindromsHelper.result_array(@number)
    redirect_to form_path, notice: 'Вводите числа >= 0' if @res_arr.size.zero?
  end
end