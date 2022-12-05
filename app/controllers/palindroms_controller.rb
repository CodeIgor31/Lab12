# frozen_string_literal: true

# Palindroms controller
class PalindromsController < ApplicationController
  include PalindromsHelper
  before_action :autorize, only: %i[result index]

  def index; end

  def result
    @number = form_params
    @palindrom = Palindrom.new(@number)
    if @palindrom.valid?
      @hash = @palindrom.print_res
    end
  end

  private

  def form_params
    params.permit(:num)
  end
end
