class SchedulesController < ApplicationController

  def index
  end
  def create
    date = DateTime.new(Integer(params[:date][:year]), Integer(params[:date][:month]), Integer(params[:date][:day]))
    @schedule = Schedule.find_by(start: date)
    @schedule = Schedule.new(start: date, end: date, title: "予定なし") unless @schedule
    if @schedule.save
      render json: @schedule.to_json(only: [:title, :start, :end])
    end
  end

  def events
    @schedules = Schedule.all
    respond_to do |format|
      format.json {
        render json: 
        @schedules.to_json(only: [:title, :start, :end])
      }
    end
  end
  
  private
  def schedule_params
    params.require(:date).permit(:year, :month, :day)
  end
end
