defmodule RegistrocolegioWeb.Router do
  use RegistrocolegioWeb, :router
  alias RegistrocolegioWeb.InstitutoController
  alias RegistrocolegioWeb.DocenteController
  alias RegistrocolegioWeb.MateriaController


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/institutos", InstitutoController, except: [:edit, :new]
    get "/institutos/ciudad/:ciudad", InstitutoController, :traerciudades





    resources "/docentes", DocenteController, except: [:edit, :new]
    #get "/api/docentes/mayores", DocenteController, :mayores



    resources "/materias", MateriaController, except: [:edit, :new]
  end
end
