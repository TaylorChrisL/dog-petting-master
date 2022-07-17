class Dog
  attr_accessor :x, :y
  def initialize
    image1 = Gosu::Image.new("./media/dog1.png", retro: true)
    image2 = Gosu::Image.new("./media/dog2.png", retro: true)
    image3 = Gosu::Image.new("./media/dog3.png", retro: true)
    image4 = Gosu::Image.new("./media/dog4.png", retro: true)
    image5 = Gosu::Image.new("./media/dog5.png", retro: true)
    @dog_anim = [image1, image2, image3, image4, image5]
    @dog_anim_flipped = []

    # generates flipped images of array
    @dog_anim.each do |dog|
      image_to_flip = dog
      image_flipped = Gosu::render(image_to_flip.width, image_to_flip.height, retro: true) do 
        image_to_flip.draw_rot(image_to_flip.width / 2, image_to_flip.height / 2, 0, 0, 0.5, 0.5, -1, 1)
      end
      @dog_anim_flipped << image_flipped
    end

    @image_count = 0
    @x = 200
    @y = 200
    @width = 110
    @height = 85
    @velocity_x = 3
    @velocity_y = 3
  end

  def update_dog
    @x += @velocity_x
    @y += @velocity_y

    # adds boundaries to game window so dog can't run off screen
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0

    if @image_count == 5
      @dog_anim.rotate!
      @dog_anim_flipped.rotate!
      @image_count = 0
    else
      @image_count += 1
    end
  end

  def draw_dog

    if @velocity_x > 0
      @dog_anim_flipped.first.draw(@x - @width / 2, @y - @height / 2, 1)
    else
      @dog_anim.first.draw(@x - @width / 2, @y - @height / 2, 1)
    end
  end

end