defmodule RegistrocolegioWeb.Router do
  alias RegistrocolegioWeb.MateriaController
  alias RegistrocolegioWeb.InstitutoController
  alias RegistrocolegioWeb.DocenteController
  use RegistrocolegioWeb, :router


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/institutos", InstitutoController, except: [:edit, :new]


    resources "/docentes", DocenteController, except: [:edit, :new]


    resources "/materias", MateriaController, except: [:edit, :new]


  end
end
