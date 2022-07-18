require 'gosu'
require_relative 'cursor.rb'
require_relative 'dog.rb'
require_relative 'ui.rb'

class DogPettingMaster < Gosu::Window
  def initialize
    # generates window
    super(800, 600)
    self.caption = "Pet the Dog!"
    @hand = Cursor.new
    @dog = Dog.new
    @ui = UI.new
    @background_image = Gosu::Image.new("./media/battleback1.png", :tileable => true)
  end

  def needs_cursor?
    false
  end

  def update
    @dog.update_dog
    @hand.update_cursor
  end

  def draw()
    @background_image.draw(0, 0, 0)
    @dog.draw_dog
    @hand.draw_cursor(mouse_x, mouse_y)
    @ui.draw_ui
    draw_quad(0, 0, @ui.c, 800, 0, @ui.c, 800, 600, @ui.c, 0, 600, @ui.c)
  end

  # checks if mouse is clicked close enough to dog to pet the dog
  def button_down(id)
    if id == Gosu::MsLeft
      if Gosu.distance(mouse_x, mouse_y, @dog.x, @dog.y) < 50
        @ui.hit = 1
        @ui.score += 1
      else
        @ui.hit = -1
      end
      @hand.click_draw = true
    end
  end

end

window = DogPettingMaster.new
window.show