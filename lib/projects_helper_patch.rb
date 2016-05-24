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

require_dependency 'projects_helper'

module ProjectsHelperPatch

    def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable
            alias_method_chain :project_settings_tabs, :hook
        end
    end

    module ClassMethods
    end

    module InstanceMethods

        def project_settings_tabs_with_hook
            tabs = project_settings_tabs_without_hook
            call_hook(:add_projects_settings_tabs, { :tabs => tabs })
            return tabs
        end

    end

end
