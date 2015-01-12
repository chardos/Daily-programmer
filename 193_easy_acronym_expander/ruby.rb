require 'ostruct'

$acronyms=OpenStruct.new(
  lol: 'laugh out loud',
  dw: "don't worry",
  hf: 'have fun',
  gg: 'good game',
  brb: 'be right back',
  g2g: 'got to go',
  wtf: 'what the fuck',
  wp: 'well played',
  gl: 'good luck',
  imo: 'in my opinion'
)

class Sentence
  attr_accessor :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def expand
    arr = @sentence.split(' ')
    arr.each_with_index{ |x, i| 
      #puts x
      $acronyms.to_h.each{ |k,v| 
        if x == k.to_s
          arr[i] = v
        end
      }
    }
    puts arr.join(' ')
  end
end

s1 = Sentence.new('hey lol wtf is that')

s1.expand

