class MenuShop
  def initialize
    @shop_button = Gosu::Image.new("./media/UI-assets/shop_normal.png")
    @button_width = 54
    @button_height = 54
    @x = 40
    @y = 560
  end

  def draw_shop
    @shop_button.draw(@x - @button_width / 2, @y - @button_height / 2, 1)
  end
end 