require "yaml"
require "pry"


def load_library(emoticons)
emoticons = YAML.load_file("./lib/emoticons.yml")
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
    emoticons.each do |english_word, emoticon_array|
      emoticon_array.each do |emoticon|
        emoticon_hash["get_meaning"][emoticon_array[1]] = english_word
        emoticon_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
      end
    end
  return emoticon_hash
end

def get_japanese_emoticon(emoticons, emoticon)
emoticon_hash = load_library(emoticons)
  answer = emoticon_hash["get_emoticon"][emoticon]
    if answer == nil
      answer = "Sorry, that emoticon was not found"
    end
  answer
end

def get_english_meaning(emoticons, emoticon)
emoticon_hash = load_library(emoticons)
  answer = emoticon_hash["get_meaning"][emoticon]
    if answer == nil
      answer = "Sorry, that emoticon was not found"
    end
  answer
end
