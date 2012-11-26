require "minitest_helper"

describe "routes acceptance test" do
  test "root" do
    assert_routing '/', controller: 'home', action: 'index'
  end

  test "memberships" do
    assert_routing({method: :post,   path: '/memberships'}, {controller: 'memberships', action: 'create'})
    assert_routing({method: :delete, path: '/memberships/69'}, {controller: 'memberships', action: 'destroy', id: '69'})
  end

  test "artists" do
    assert_routing({method: :get,  path: '/artists'}, {controller: 'artists', action: 'index'})
    assert_routing({method: :get,  path: '/artists/69'}, {controller: 'artists', action: 'show', id: '69'})
    assert_routing({method: :get,  path: '/artists/new'}, {controller: 'artists', action: 'new'})
    assert_routing({method: :get,  path: '/artists/69/edit'}, {controller: 'artists', action: 'edit', id: '69'})
    assert_routing({method: :post, path: '/artists'}, {controller: 'artists', action: 'create'})
    assert_routing({method: :put,  path: '/artists/69'}, {controller: 'artists', action: 'update', id: '69'})
    assert_routing({method: :delete,  path: '/artists/69'}, {controller: 'artists', action: 'destroy', id: '69'})
  end

  test "lyrics" do
    assert_routing({method: :get,  path: '/artists/88/lyrics'}, {controller: 'lyrics', action: 'index', artist_id: '88'})
    assert_recognizes({controller: 'lyrics', action: 'show', artist_id: '88', id: '69'}, '/artists/88/lyrics/69')
    assert_recognizes({controller: 'lyrics', action: 'new', artist_id: '88'}, {path: '/artists/88/lyrics/new', method: :get})
    assert_recognizes({controller: 'lyrics', action: 'edit', artist_id: '88', id: '69'}, {path: '/artists/88/lyrics/69/edit', method: :get})
    assert_recognizes({controller: 'lyrics', action: 'create', artist_id: '88'}, {path: '/artists/88/lyrics', method: :post})
    assert_recognizes({controller: 'lyrics', action: 'update', artist_id: '88', id: '69'}, {path: '/artists/88/lyrics/69', method: :put})
    assert_recognizes({controller: 'lyrics', action: 'destroy', artist_id: '88', id: '69'}, {path: '/artists/88/lyrics/69', method: :delete})
  end

  test "explanations" do
  end
end
