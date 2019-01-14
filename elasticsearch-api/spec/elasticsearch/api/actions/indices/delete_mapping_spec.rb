# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'spec_helper'

describe 'client.indices#delete_mapping' do

  let(:expected_args) do
    [
        'DELETE',
        url,
        params,
        nil,
        nil
    ]
  end

  let(:params) do
    {}
  end

  context 'when there is no index specified' do

    let(:client) do
      Class.new { include Elasticsearch::API }.new
    end

    it 'raises an exception' do
      expect {
        client.indices.delete_mapping(type: 'foo')
      }.to raise_exception(ArgumentError)
    end
  end

  context 'when there is no type specified' do

    let(:client) do
      Class.new { include Elasticsearch::API }.new
    end

    it 'raises an exception' do
      expect {
        client.indices.delete_mapping(index: 'foo')
      }.to raise_exception(ArgumentError)
    end
  end

  context 'when an index and type are specified' do

    let(:url) do
      'foo/bar'
    end

    it 'performs the request' do
      expect(client_double.indices.delete_mapping(index: 'foo', type: 'bar')).to eq({})
    end
  end

  context 'when multiple indices are specified' do

    let(:url) do
      'foo,bar/baz'
    end

    it 'performs the request' do
      expect(client_double.indices.delete_mapping(index: ['foo','bar'], type: 'baz')).to eq({})
    end
  end

  context 'when the path must be URL-escaped' do

    let(:url) do
      'foo%5Ebar/bar%2Fbam'
    end

    it 'performs the request' do
      expect(client_double.indices.delete_mapping(index: 'foo^bar', type: 'bar/bam')).to eq({})
    end
  end
end