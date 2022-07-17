require 'gosu'

class DogPettingMaster < Gosu::Window
  def initialize
    # generates window
    super(800, 600)
    self.caption = "Pet the Dog!"

    # generates dog image
    @image = Gosu::Image.new("./media/dog1.png")
    @x = 200
    @y = 200
    @width = 110
    @height = 85
    @velocity_x = 3
    @velocity_y = 3

    # generate hand cursor
    @hand_image = Gosu::Image.new("./media/handopen.png")

    # used to check if hand pets dog
    @hit = 0

    # tracks/writes score
    @font = Gosu::Font.new(30)
    @score = 0

    # generate background
    @background_image = Gosu::Image.new("./media/battleback1.png", :tileable => true)

  end

  def update
    @x += @velocity_x
    @y += @velocity_y

    # adds boundaries to game window so dog can't run off screen
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
  end

  def draw()
    # draws the background
    @background_image.draw(0, 0, 0)

    # sets point to draw at center of image
    @image.draw(@x - @width / 2, @y - @height / 2, 1)

    # sets point to draw hand at center of cursor
    @hand_image.draw(mouse_x - 26, mouse_y - 25, 1)

    # reacts to if dog is petted
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    
    # currently used to flash screen red or green based on hit or miss when petting dog

    # parameters are (xcord of corner, ycord of corner, color wanted in corner, etc for all four corners)
    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    @hit = 0
    
    # draws the score
    @font.draw(@score.to_s, 700, 20, 2)
  end

  # checks if mouse is clicked close enough to dog to pet the dog
  def button_down(id)
    if id == Gosu::MsLeft
      if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50
        @hit = 1
        @score += 1
      else
        @hit = -1
      end
    end
  end

end

window = DogPettingMaster.new
window.show