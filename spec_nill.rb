class Birthday
  def greating
    "Felicidades"
  end
end

class Engine
  def start
    "engine started"
  end
end

class NumberThing
  def primes
    [3, 5, 7]
  end
end

class Car
  attr_accessor :engine

  def initialize(params)
    @engine = params[:engine] || NilObject.new(:start, "whell, sorry but there is no car")
  end
end

class Prime
  attr_accessor :number_thing

  def initialize(params)
    @number_thing = params[:number_thing] || NilObject.new(:primes, [])
  end
end

class User
  attr_accessor :birthday

  def initialize(params)
    @birthday = params[:birthday] || NilObject.new(:greating, "nil message")
  end
end

class NilObject
  def initialize(method_name, response)
    self.class.send :define_method, method_name do 
      response
    end
  end
end

describe "greating when user birthday " do
  context "user has birthday date" do
    it "should give greating" do
      user = User.new(birthday:Birthday.new)
      expect(user.birthday.greating).to eq "Felicidades"
    end
  end
  context "user has not birthday date and has a nil " do
    it "should return nil message" do
      user = User.new(birthday: nil)
      expect(user.birthday.greating).to eq "nil message"
    end
  end
end

describe Car do
  describe "starting the engine" do
    it "returns a message indicating that the car is running when the car is empty" do
      car = Car.new(engine: Engine.new)
      expect(car.engine.start).to eq "engine started"
    end

    it "returns a message indicating that there is no car to start when the car is nil" do
      car = Car.new(engine: nil)
      expect(car.engine.start).to eq "whell, sorry but there is no car"
    end
  end
end

describe Prime do
  describe "returning prime numbers" do
    it "returns an array with prime numbers when the number object is present" do
      prime = Prime.new(number_thing: NumberThing.new)
      expect(prime.number_thing.primes).to eq [3, 5, 7]
    end

    it "returns an empty array when the number object is nil" do
      prime = Prime.new(number_thing: nil)
      expect(prime.number_thing.primes).to eq []
    end
  end
end
