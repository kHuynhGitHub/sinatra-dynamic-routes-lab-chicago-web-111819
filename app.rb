require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @reversed = params[:name].reverse
  end

  get '/square/:number' do
    @squared = (params[:number].to_i ** 2).to_s
  end

  get '/say/:number/:phrase' do
    combined = ''
    params[:number].to_i.times do
      combined += params[:phrase]
    end
    combined
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i
    answer = 'Invalid.'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    end
  end
end
