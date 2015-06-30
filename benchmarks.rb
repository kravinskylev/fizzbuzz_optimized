require 'nokogiri'
require 'net/http'
require 'benchmark'

class DisguisedFizzBuzzSelf
  def self.cracklepop?(num, mod1, mod2)
    case
      when num % (mod1 * mod2)  == 0 then "CracklePop"
      when num %  mod1          == 0 then "Crackle"
      when num %  mod2          == 0 then "Pop"
      else num
    end
  end

  def self.cracklepop_to(limit, mod1, mod2)
    1.upto(limit).map do |num|
      cracklepop?(num, mod1, mod2)
    end
  end
end
# This solution allows any limit and any two numbers to set as parameters.
# It uses self methods and a case statement.
# ______________________________________________________________________________

class CaseFizzBuzzSelf
  def self.cracklepop?(num)
    case
      when num % (3 * 5)     == 0 then "CracklePop"
      when num %  3          == 0 then "Crackle"
      when num %  5          == 0 then "Pop"
      else num
    end
  end

  def self.cracklepop_to_1000
    1.upto(1000).map do |num|
      cracklepop?(num)
    end
  end
end
# This solution was to see if performance was improved by making it always run 1000 numbers with 3 and 5,
# instead of allowing different parameters.
# _________________________________________________________________________________

class ConditionalFizzBuzzSelf
  def self.fizzbuzz(num)
    1.upto(num).each do |x|
      if x % 3 == 0 && x % 5 == 0
        "FizzBuzz"
      elsif x % 5 == 0
        "Buzz"
      elsif x % 3 == 0
        "Fizz"
      else
        x
      end
    end
  end
end
# This solution is a classic basic conditional Fizzbuzz with self. It is slow, as expected.
# ___________________________________________________________________________________

class ConditionalFizzBuzz
  def fizzbuzz(num)
    1.upto(num).each do |x|
      if x % 3 == 0 && x % 5 == 0
        "FizzBuzz"
      elsif x % 5 == 0
        "Buzz"
      elsif x % 3 == 0
        "Fizz"
      else
        x
      end
    end
  end
end
# This is the exact same as above but doesn't use Class methods,
# as I was curious if they reduced or improved performance.
# ________________________________________________________________________________________

class RosettaCode
  def self.get_fizzbuzz
   # get the HTML from the website
   uri  = URI("http://rosettacode.org/wiki/FizzBuzz")
   body = Net::HTTP.get(uri)

   # parse it and use CSS selectors to find all links in list elements
   document     = Nokogiri::HTML(body)
   solutions    = document.css('.ruby')
   puts solutions.first
  end
end






Benchmark.bmbm(10) do |x|
  x.report("CracklepPopSelf w/ Case:")  { DisguisedFizzBuzzSelf.cracklepop_to(1000, 3, 5) }
  x.report("BasicFizzBuzzSelf w/ Cond") { ConditionalFizzBuzzSelf.fizzbuzz(1000) }
  x.report("BasicFizzBuzzSelf w/ Cond") { CaseFizzBuzzSelf.cracklepop_to_1000 }
  x.report("BasicFizzBuzz w/ Cond") { fb = ConditionalFizzBuzz.new; fb.fizzbuzz(1000) }
  x.re[prt("Rosetta") { RosettaCode.get_fizzbuzz }
end


