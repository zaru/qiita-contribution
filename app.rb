class WebApp < Sinatra::Base

  register Sinatra::AssetPack

  qiita_config = {
    :qiita_state => 'haue73aueaoakdjfh13yehd934g46dh',
    :qiita_client_id => 'bb80979a6790e220449e26cf0f9dd3a502af6f4b',
    :qiita_scope => 'read_qiita'
  }

  assets do
    serve '/js', from: 'bower_components/'
    serve '/css', from: 'bower_components/'
    serve '/scss', from: 'assets/scss/'

    js :application, [
                     '/**/*.js'
                   ]

    js_compression :jsmin

    css :application, [
                      '/**/*.css',
                      '/**/*.scss',
                    ]
    css_compression :scss
  end

  before do
    @qiita_config = qiita_config
  end

  get '/' do
    slim :index
  end

end