class Api::V1::CollateralsKindController < ApplicationController
  def index
    response = [
      { id: 1, name: "Name1", color: "#fff000" },
      { id: 3, name: "Name2", color: "#fff000" }
    ]

    render :json => response
  end

  def create
    create_dto = create_dto_from_body(CreateCollateralKindDto.new)

    render :json => create_dto
  end
end