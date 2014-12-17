# -*- encoding : utf-8 -*-
require 'unit/pacto/contract_spec'

module Pacto
  describe LegacyContract do
    let(:request_clause) do
      Pacto::RequestClause.new(
        http_method: 'GET',
        host: 'http://example.com',
        path: '/',
        schema:  {
          type: 'object',
          required: true # , :properties => double('body definition properties')
        }
      )
    end

    let(:response_clause) do
      Pacto::ResponseClause.new(status: 200)
    end
    let(:adapter) { double 'provider' }
    let(:file) { 'contract.json' }
    let(:consumer_driver) { double }
    let(:provider_actor) { double }

    subject(:contract) do
      described_class.new(
        request: request_clause,
        response: response_clause,
        file: file,
        name: 'sample'
      )
    end

    it_behaves_like 'a contract'
  end
end
