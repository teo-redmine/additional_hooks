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

require_dependency 'settings_controller'

module SettingsControllerPatch

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
        unloadable
        alias_method_chain :plugin, :hook
    end
  end

  module ClassMethods
  end

  module InstanceMethods

    def plugin_with_hook
      # Progress Reports Plugin
      if(params[:progress_reports_template])
        if (!params[:progress_reports_template].empty?)
          do_upload_progress_report_template(params[:progress_reports_template])
        else
          flash[:info] = l(:info_template_empty)
          redirect_to :back
        end
      else # Default
        plugin_without_hook
      end
    end

# Progress Reports Plugin #

    def do_upload_progress_report_template(filename)
      if call_hook(:progress_reports_settings_controller_plugin_hook, { :filename => filename }).first
        flash[:notice] = l(:success_upload_file)
      else
        flash[:error] = l(:error_upload_file)
      end
      redirect_to :back
    end

  end

end
