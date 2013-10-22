require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :logging, true

VOWELS = %w(a e i o u).join
CONSONANTS = (('a'..'z').to_a - VOWELS.split('')).join

def english_to_pig_latin(phrase)
  phrase.split(/\s+/).map { |word|
    case word
    when /^([#{CONSONANTS}]+)([#{VOWELS}]+.*)$/i
      "#{Regexp.last_match[2]}#{Regexp.last_match[1]}ay".downcase
    when /^[#{VOWELS}]/
      "#{word}ay"
    else
      word
    end
  }.join(' ')
end

post '/translate' do
  JSON.dump({
    english: params[:phrase],
    pig_latin: english_to_pig_latin(params[:phrase])
  })
end
