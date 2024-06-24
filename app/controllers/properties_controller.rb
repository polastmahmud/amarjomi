# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_agent!, only: %i[new create edit update destroy]

  def index
    @properties = Property.available

    if params[:variant].present? && params[:variant] != 'All'
      @properties = @properties.filter_by_variant(params[:variant])
      @selected_variant = params[:variant]
    end

    if params[:order_by].present? && params[:order_by] != 'default'
      @properties = @properties.order_by(params[:order_by])
      @selected_order = params[:order_by]
    end

    @properties = @properties.filter_by_caption(params[:caption]) if params[:caption].present?
  end

  def show
    @agent = @property.agent
  end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to property_url(@property), notice: 'Property was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.agent.id != current_agent.id
      redirect_to property_url(@property), notice: 'You are not permitted to edit this property.'
    end

    if @property.update(property_params)
      redirect_to property_url(@property), notice: 'Property was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy!

    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:caption, :area, :location, :variant, :status, :description, :size, :agent_id,
                                     images: [])
  end
end
