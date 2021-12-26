class Admin::HomesController < ApplicationController
  def top
    @shops = Shop.where(is_active: 0)
  end
end
