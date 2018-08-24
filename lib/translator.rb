require "yaml"

def load_library(file)
	output = {"get_meaning" => {}, "get_emoticon" =>{}}
 	input = YAML.load_file(file)
 	input.each do |meaning, emoticons|
 		output["get_meaning"][emoticons[1]] = meaning
    	output["get_emoticon"][emoticons[0]] = emoticons[1]
    end
    output
end

def get_japanese_emoticon(file, emoticon)
	input = load_library(file)
	if input["get_emoticon"].keys.include?(emoticon)
		input["get_emoticon"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end
end

def get_english_meaning(file, emoticon)
	input = load_library(file)
	if input["get_meaning"].keys.include?(emoticon)
		input["get_meaning"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end
end