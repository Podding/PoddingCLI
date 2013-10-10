# encoding: utf-8

require_relative '../helper'

describe 'sort_meta_with_orde' do
  before do
    @order = { one: 1, two: 2 }
    @known_meta = { two: "foo", one: "bar" }
    @unknown_meta = { four: "what", three: "wut" }
    @mixed_meta = @unknown_meta.merge(@known_meta)
  end

  it 'should sort known meta entries according to supplied order' do
    sort_meta_with_order(@known_meta, @order).must_equal({ one: "bar",two: "foo" })
  end

  it 'should not change the order of unknown items' do
    sort_meta_with_order( @unknown_meta, @order ).must_equal(@unknown_meta)
  end

  it 'should sort known meta before unknown, which shouldn\'t be sorted' do
    sort_meta_with_order(@mixed_meta, @order).must_equal({one: "bar", two: "foo", four: "what", three: "wut"})
  end

end