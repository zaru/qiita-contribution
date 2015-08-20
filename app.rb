class WebApp < Sinatra::Base

  register Sinatra::AssetPack

  qiita_config = {
    :qiita_state => 'haue73aueaoakdjfh13yehd934g46dh',
    :qiita_client_id => 'bb80979a6790e220449e26cf0f9dd3a502af6f4b',
    :qiita_scope => 'read_qiita'
  }

  assets do
    serve '/js', from: 'bower_components/'

    js :application, [
                     '/**/*.js'
                   ]

    js_compression :jsmin
  end

  before do
    @qiita_config = qiita_config
  end

  get '/' do
    slim :index
  end

  get '/auth_complete' do
    @code = request['code']
    slim :auth_complete
  end

end