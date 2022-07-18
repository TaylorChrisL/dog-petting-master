class MenuShop
  attr_reader :cursor_scale, :hit_multiplier, :clicks_per_second, :treats_spawn_chance

  def initialize
    @shop_button = Gosu::Image.new("./media/UI-assets/shop_normal.png")
    @button_width = 54
    @button_height = 54
    @x = 40
    @y = 560

    # shop items
    @cursor_scale = 1
    @hit_multiplier = 1
    @clicks_per_second = 0
    @treats_spawn_chance = 0
  end

  def draw_shop
    @shop_button.draw(@x - @button_width / 2, @y - @button_height / 2, 1)
  end

  # def shop
  #   # bigger_cursor
  #   if bigger_cursor
  #     @cursor_scale *= 1.12
  #   # better petter
  #   if better_petter
  #     @hit_multiplier *= 2.2
  #   # auto pets
  #   if auto_petting
  #     @clicks_per_second += 1
  #   # random treats
  #   if random_treats
  #     @treats_spawn_chance += 0.01
  # end



end 