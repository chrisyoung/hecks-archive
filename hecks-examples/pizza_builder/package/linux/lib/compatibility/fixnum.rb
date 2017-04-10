# Ruby 2.2.2 doesn't support Fixnum#positive?, so monkey patch it.
class Fixnum
  def positive?
    self > 0
  end
end
