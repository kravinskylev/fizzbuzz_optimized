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










Benchmark.bmbm(10) do |x|
  x.report("CracklepPopSelf w/ Case:")  { DisguisedFizzBuzzSelf.cracklepop_to(1000, 3, 5) }
  x.report("BasicFizzBuzzSelf w/ Cond") { ConditionalFizzBuzzSelf.fizzbuzz(1000) }
  x.report("BasicFizzBuzzSelf w/ Cond") { CaseFizzBuzzSelf.cracklepop_to_1000 }
end


