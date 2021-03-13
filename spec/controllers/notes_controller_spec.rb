require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe 'as guest' do
    describe 'GET #index' do
      it 'redirects to sign in page' do
        get :index
        expect(response).to have_http_status '302'
      end
    end

    describe 'GET #show' do
      it 'redirects to sign in page' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status '302'
      end
    end

    describe 'GET #new' do
      it 'redirects to sign in page' do
        get :new
        expect(response).to have_http_status '302'
      end
    end

    describe 'GET #edit' do
      it 'redirects to sign in page' do
        get :edit, params: { id: 1 }
        expect(response).to have_http_status '302'
      end
    end

    describe 'POST #create' do
      it 'redirects to sign in page' do
        notes_params = attributes_for(:note)
        post :create, params: { notes: notes_params }
        
        expect(response).to have_http_status '302'
      end
    end

    describe 'PUT #create' do
      it 'redirects to sign in page' do
        notes_params = attributes_for(:note)
        put :update, params: { id: 1, notes: notes_params }
        
        expect(response).to have_http_status '302'
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to sign in page' do
        delete :destroy, params: { id: 1 }
        
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'as authenticated user' do
    before do
      @user = create(:user)
      @note = create(:note)

      sign_in @user
    end

    describe 'GET #index' do
      it 'populates an array of notes' do
        note = create(:note, user: @user)
        get :index

        expect(assigns(:notes)).to eq([note])
      end
      
      it 'renders the :index view' do
        get :index

        expect(response).to render_template(:index)
      end
    end 

    describe 'GET #show' do
      before :each do
        @note = create(:note, user: @user)
      end

      it 'assigns the requested note to @note' do
        note = create(:note, user: @user)
        get :show, params: { id: @note }

        expect(assigns(:note)).to eq(@note)
      end
      
      it 'renders the #show view' do
        note = create(:note, user: @user)
        get :show, params: { id: @note }
        
        expect(response).to render_template(:show)
      end

      it 'redirect to index when access is denied' do
        invalid_note = create(:note)
        get :show, params: { id: invalid_note }

        expect(response).to redirect_to(notes_path)
      end
    end 

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates a new note' do
          expect {
            post :create, params: { note: attributes_for(:note) }
          }.to change(Note, :count).by(1)
        end

        it 'redirects to show page' do
          post :create, params: { note: attributes_for(:note) }
          expect(response).to have_http_status '302'
        end
      end

      context 'with empty attributes' do
        it 'does not save the note' do
          expect {
            post :create, params: { note: { title: nil, content: nil, date_taken: nil } }
          }.to_not change(Note, :count)
        end

        it 'render new page' do
          post :create, params: { note: { title: nil, content: nil, date_taken: nil } }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      before :each do
        @note = create(:note, user: @user)
      end

      context 'with valid attributes' do
        it 'change attributes for note' do
          put :update, params: { id: @note.id, note: { title: 'new', content: 'fresh content' } }

          @note.reload

          expect(@note.title).to eq('new')
          expect(@note.content).to eq('fresh content')
        end

        it 'redirects to updated note' do
          put :update, params: { id: @note.id, note: { title: 'new', content: 'fresh content' } }
          expect(response).to have_http_status '302'
        end
      end

      context 'with invalid attributes' do
        it 'does not update the note' do
          expect {            
            put :update, params: { id: @note.id, note: { title: nil, content: nil, date_taken: nil } }
          }.to_not change(Note, :count)
        end

        it 'render edit page' do
          put :update, params: { id: @note.id, note: { title: nil, content: nil, date_taken: nil } }
          expect(response).to render_template(:edit)
        end

        it 'redirect to index when tries to update other user note' do
          invalid_note = create(:note)
          put :update, params: { id: invalid_note.id, note: { title: nil, content: nil, date_taken: nil } }

          expect(response).to redirect_to(notes_path)
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @note = create(:note, user: @user)
      end
  
      it 'deletes the note' do
        expect {
          delete :destroy, params: { id: @note }       
        }.to change(Note, :count).by(-1)
      end
        
      it 'redirects to notes#index' do
        delete :destroy, params: { id: @note }   
        expect(response).to redirect_to(notes_path)
      end

      it 'do not delete other user note' do
        invalid_note = create(:note)

        expect {
          delete :destroy, params: { id: invalid_note }       
        }.to_not change(Note, :count)
      end
    end
  end
end
