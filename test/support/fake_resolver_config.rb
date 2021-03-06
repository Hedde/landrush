module FakeResolverConfigHooks
  def setup
    super
    @test_resolver_config_dir = Pathname('/tmp/landrush_fake_resolver')
    Landrush::ResolverConfig.config_dir = @test_resolver_config_dir
    Landrush::ResolverConfig.sudo       = ''
  end

  def teardown
    super
    Landrush::ResolverConfig.sudo = 'sudo'
    if @test_resolver_config_dir.exist?
      @test_resolver_config_dir.rmtree
    end
  end
end

class MiniTest::Spec
  include FakeResolverConfigHooks
end
