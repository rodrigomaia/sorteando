RSpec::Matchers.define :included_in do |expected|
  match do |actual|
    retorno = true
    retorno = false if actual.empty? || expected.empty?
    actual.each do |iten|
      if not expected.map(&:id).include?(iten.try(:id))
        retorno = false
        break
      end
    end
    retorno
  end

  failure_message_for_should do |actual|
    "expected that #{actual} be included on #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be included on #{expected}"
  end

  description do
    "be included on #{expected}"
  end
end