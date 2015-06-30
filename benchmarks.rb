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
     puts cracklepop?(num, mod1, mod2)
    end
  end
end

class BasicFizzBuzzSelf
  def self.fizzbuzz(num)
    1.upto(num).each do |x|
      if x % 3 == 0 && x % 5 == 0
        puts "FizzBuzz"
      elsif x % 5 == 0
        puts "Buzz"
      elsif x % 3 == 0
        puts "Fizz"
      else
        puts x
      end
    end
  end
end










Benchmark.bmbm(10) do |x|
  x.report("CracklepPopSelf w/ Case:") { DisguisedFizzBuzzSelf.cracklepop_to(1000, 3, 5) }
  x.report("BasicFizzBuzzSelf w/ Cond") { BasicFizzBuzzSelf.fizzbuzz(1000) }
end


