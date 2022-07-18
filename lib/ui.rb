require_relative 'menu_shop.rb'

class UI
  attr_accessor :score, :hit, :c

  def initialize
    @font = Gosu::Font.new(30)
    @score = 0
    @hit = 0
    @c = Gosu::Color::NONE
    @shop = MenuShop.new
  end

  def draw_ui
    if @hit == 0
      @c = Gosu::Color::NONE
    elsif @hit == 1
      @c = Gosu::Color::GREEN
    elsif @hit == -1
      @c = Gosu::Color::RED
    end

    @hit = 0

    @font.draw(@score.to_s, 700, 20, 2)
    @shop.draw_shop
  end
end