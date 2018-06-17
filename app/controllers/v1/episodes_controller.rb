class V1::EpisodesController < ApplicationController
	def index 
		@episodes = Episode.all

		render json: @episodes, status: :ok
	end

	def create
		@episode = Contact.new(contact_params)


		@episode.save
		render json: @episode, status: :created
	end

	def destroy
		@episode = Episode.where(id: params[:id]).first

		if @episode.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end


	private
	def contact_params
		params.require(:contact).permit(:title, :content)
	end
end
