class Birthday
  def greating
    "Felicidades"
  end
end

class NilBirthday
  def greating
    "nil message"
  end
end

class User
  def initialize(params)
    @birthday = params[:birthday]
  end
  
  def birthday
    @birthday || NilBirthday.new
  end

end

context "greating when user birthday " do
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
