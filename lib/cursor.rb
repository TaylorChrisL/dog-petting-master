class Cursor
  attr_accessor :click_draw, :reset_click, :cursor_scale

  def initialize
    @click_draw = false
    @reset_click = 0
    @cursor_scale = 1

    @hand_image = Gosu::Image.new("./media/handopen.png")
    @hand_close_image = Gosu::Image.new("./media/handclose.png")
  end

  def update_cursor
    if @click_draw == true
      if @reset_click == 5
        @click_draw = false
        @reset_click = 0
      else
        @reset_click += 1
      end
    end
  end

  def draw_cursor(mouse_x, mouse_y)
    if @click_draw
      @hand_close_image.draw(mouse_x - 26, mouse_y - 25, 3, scale_x = @cursor_scale, scale_y = @cursor_scale)
    else
      @hand_image.draw(mouse_x - 26, mouse_y - 25, 3)
    end
  end
end