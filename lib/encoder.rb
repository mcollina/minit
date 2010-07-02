
module Encoder

  # See http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener
  
  # The alphabet we are going to use is [a-zA-Z0-9]. It contains 62 letters.
  # Take the auto-generated unique numerical key: for example 125.
  # Now you have to convert the 125 (base 10) to X (base 62). This will then be 
  # {2}{1} (2×62+1=125).
  # Now map the symbols {2} and {1} to your alphabet. Say {0} = 'a', {25} = 'z' 
  # and so on. We will have {2} = 'c' and {1} = 'b'. 
  # So '/cb' will be your shortened url.

  
  LIST = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  SIZE = LIST.size
  HASH = {}
  
  # fill the hash
  LIST.each_index { |k| HASH[LIST[k]] = k }
  

  def self.encode(num)
    raise "Encoding of negative number unsupported" if num < 0
    
    result = ""
    while num > 0 do      
      remainder = num % SIZE
      result.insert(0,LIST[remainder])
      num = num / SIZE
    end
    
    return result
  end
  
  def self.decode(string)
    num = 0
    index = 1
    string.split("").reverse.each do |char|
      char_index = HASH[char]
      raise "Decoding of disallowed chars" unless char_index
      num += index*char_index
      index *= SIZE
    end
    
    num
  end

end
