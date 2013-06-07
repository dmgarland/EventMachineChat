class Client
  attr_accessor :ws
  attr_accessor :name

  def initialize(ws)
    self.ws = ws
  end
end