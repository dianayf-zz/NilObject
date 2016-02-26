class Birthday
  def greating
    "Felicidades"
  end
end

class NilObject
  def initialize(method_name, response)
    self.class.send :define_method, method_name do 
      response
    end
  end
end

class User
  def initialize(params)
    @birthday = params[:birthday] || NilObject.new(:greating, "nil message")
  end
  
  def birthday
    @birthday
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
