require 'pry'
require "yaml"

def load_library(file)
  file = YAML.load_file(file)
  emoticons={}
  emoticons["get_meaning"]={}
  emoticons["get_emoticon"]={}
  file.each do |meaning, both_emoticons|
    english=both_emoticons[0]
    japanese=both_emoticons[1]
    emoticons["get_meaning"][japanese]=meaning
    emoticons["get_emoticon"][english]=japanese
  end
  emoticons
end

def get_japanese_emoticon(file,emoticon)
  emoticon_hash= load_library(file)
  if emoticon_hash["get_emoticon"].include?(emoticon)==true
    return emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file,emoticon)
  emoticon_hash= load_library(file)
  if emoticon_hash["get_meaning"].include?(emoticon)==true
    return emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
