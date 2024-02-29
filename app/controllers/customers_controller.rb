class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customer = Customer.order(:full_name)
  end
end
