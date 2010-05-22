#!/bin/python3

import os
import sys

from urllib.request import urlopen

API_BASE_URL = "http://www.opengl.org/registry/api/{}"

SRC_LIST = {
        "gl" :
        [ "enum.spec", "enumext.spec", "gl.spec", "gl.tm" ],
        "glx" :
        [ "glxenum.spec", "glxenumext.spec", "glx.spec", "glxext.spec", "glx.tm" ],
        "wgl" :
        [ "wglenum.spec", "wglenumext.spec", "wgl.spec", "wglext.spec", "wgl.tm" ]
}

def update_specs(spec_list = SRC_LIST, api_url = API_BASE_URL):
    for api in spec_list.keys():
        if not os.path.exists(api):
            os.makedirs(api)
            for spec_file in spec_list[api]:
                open(os.path.join(api,spec_file), "w").write(urlopen(api_url.format(spec_file)).read().decode())

