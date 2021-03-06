# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module XPack
    module API
      module Migration
        module Actions; end

        class MigrationClient
          include Elasticsearch::API::Common::Client, Elasticsearch::API::Common::Client::Base, Migration::Actions
        end

        def migration
          @migration ||= MigrationClient.new(self)
        end

      end
    end
  end
end
