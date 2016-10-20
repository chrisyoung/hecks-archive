# frozen_string_literal: true
require 'sinatra'
require_relative 'methods'

module Hecks
  module Adapters
    module ResourceServer
      class App < Sinatra::Base
        configure do
          set :dump_errors, false
          set :raise_errors, true
          set :show_exceptions, false
        end

        def initialize(app: nil, application_adapter: Application, domain: )
          super(app)
          @methods = Methods.new(
            application_adapter: application_adapter.new(domain: domain)
          )
        end

        get "/:module_name/:id" do |module_name, id|
          methods.read.call(id: id, module_name: module_name)
        end

        post "/:module_name" do |module_name|
          methods.create.call(body: request.body, module_name: module_name)
        end

        put "/:module_name/:id" do |module_name, id|
          methods.update.call(id: id, body: request.body, module_name: module_name)
        end

        delete "/:module_name/:id" do |module_name, id|
          methods.delete.call(id: id, module_name: module_name)
        end

        private

        attr_reader :methods
      end
    end
  end
end
