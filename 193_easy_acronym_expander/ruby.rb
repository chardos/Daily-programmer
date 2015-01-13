$acronyms={
  lol: 'laugh out loud',
  dw: "don't worry",
  hf: 'have fun',
  gg: 'good game',
  brb: 'be right back',
  gtg: 'got to go',
  wth: 'what the hell',
  wp: 'well played',
  gl: 'good luck',
  imo: 'in my opinion'
}

class Sentence
  attr_accessor :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def check_for_suffix(a,k)
    without_last_letter = a[0..-2]
    last_letter = a.chars.last(1).join

    if a == k.to_s
      $acronyms[a.to_sym]
    elsif without_last_letter == k
      $acronyms[a.to_sym] + last_letter
    else 
      false
    end
  end

  def expand
    arr = @sentence.split(' ')
    arr.each_with_index{ |a, i| 
      $acronyms.each do |k, v|
        if check_for_suffix(a, k) != false
          arr[i] = check_for_suffix(a, k)
        end
      end
    }
    puts arr.join(' ')
  end
end

s1 = Sentence.new('hey lol, wth is that')
s2 = Sentence.new('brb, i gtg! wp imo')

s1.expand
s2.expand




