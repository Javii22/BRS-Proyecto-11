control 'infection-monkey-exists' do
  title 'Verificar que Infection Monkey AppImage existe en /opt'
  describe file('/opt/InfectionMonkey-v2.0.0.AppImage') do
    it { should exist }
    it { should be_executable }
  end
end

control 'infection-monkey-service' do
  title 'Verificar que el servicio systemd de Infection Monkey está activo y habilitado'
  describe service('infection-monkey') do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'infection-monkey-port' do
  title 'Verificar que el puerto HTTPS 5000 está escuchando (interfaz web activa)'
  describe port(5000) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
  end
end
