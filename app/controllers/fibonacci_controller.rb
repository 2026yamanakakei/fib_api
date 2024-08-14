class FibonacciController < ApplicationController
  require 'matrix'

  def index
    n = params[:n].to_i
    if n <= 0
      render json: { status: 400, message: "Bad request." }, status: :bad_request
    else
      render json: { result: fibonacci(n) }
    end
  end

  private

  def fibonacci(n)
    base = Matrix[[1, 1], [1, 0]]
    result = base ** n
    result[0, 1]
  end
end

