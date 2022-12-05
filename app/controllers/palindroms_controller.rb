# frozen_string_literal: true

# Palindroms controller
class PalindromsController < ApplicationController
  include PalindromsHelper
  before_action :autorize, only: %i[result index]

  def index; end

  def result
    @number = params[:num].to_i
    @hash = result_hash(@number)
    redirect_to form_path, notice: 'Вводите числа >= 0' if @hash.size.zero?
  end
end
