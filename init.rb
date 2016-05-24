# encoding: UTF-8
#
# ﻿Empresa desarrolladora: Fujitsu Technology Solutions S.A. - http://ts.fujitsu.com - Carlos Barroso Baltasar
#
# Autor: Junta de Andalucía
# Derechos de explotación propiedad de la Junta de Andalucía.
#
# Éste programa es software libre: usted tiene derecho a redistribuirlo y/o modificarlo bajo los términos de la Licencia EUPL European Public License publicada por el organismo IDABC de la Comisión Europea, en su versión 1.0. o posteriores.
#
# Éste programa se distribuye de buena fe, pero SIN NINGUNA GARANTÍA, incluso sin las presuntas garantías implícitas de USABILIDAD o ADECUACIÓN A PROPÓSITO CONCRETO. Para mas información consulte la Licencia EUPL European Public License.
#
# Usted recibe una copia de la Licencia EUPL European Public License junto con este programa, si por algún motivo no le es posible visualizarla, puede consultarla en la siguiente URL: http://ec.europa.eu/idabc/servlets/Docb4f4.pdf?id=31980
#
# You should have received a copy of the EUPL European Public License along with this program. If not, see
# http://ec.europa.eu/idabc/servlets/Docbb6d.pdf?id=31979
#
# Vous devez avoir reçu une copie de la EUPL European Public License avec ce programme. Si non, voir http://ec.europa.eu/idabc/servlets/Doc5a41.pdf?id=31983
#
# Sie erhalten eine Kopie der europäischen EUPL Public License zusammen mit diesem Programm. Wenn nicht, finden Sie da http://ec.europa.eu/idabc/servlets/Doc9dbe.pdf?id=31977

require 'redmine'

Rails.configuration.to_prepare do
  unless ProjectsController.included_modules.include?(ProjectsControllerPatch)
      ProjectsController.send(:include, ProjectsControllerPatch)
  end
  unless ProjectsHelper.included_modules.include?(ProjectsHelperPatch)
      ProjectsHelper.send(:include, ProjectsHelperPatch)
  end
  unless SettingsController.included_modules.include?(SettingsControllerPatch)
    SettingsController.send(:include, SettingsControllerPatch)
  end 
end

Redmine::Plugin.register :additional_hooks do
  name 'Redmine Additional Hooks plugin'
  author 'Junta de Andalucía'
  description 'Nuevos hooks para Redmine'
  version '0.0.1'
  url "http://www.juntadeandalucia.es"
  author_url "http://www.juntadeandalucia.es"
end
