require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:valid_attributes) {
    {
      start_date: '01-01-2010'.to_time,
      end_date: '02-01-2010'.to_time,
      description: 'Party'
    }
  }

  let(:invalid_attributes) {
    {
      start_date: '02-01-2010'.to_time,
      end_date: '10-12-2009'.to_time,
      description: 'No Party'
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "renders a JSON response with the new event" do

        post :create, params: {event: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(event_url(Event.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new event" do

        post :create, params: {event: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

end
