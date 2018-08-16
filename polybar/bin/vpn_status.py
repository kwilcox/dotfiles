#!/usr/bin/python3

import sys
import json
import subprocess

vpn_map = {'anc': '192.168.1.1',
           'pdx': '192.168.8.1',
           'ptk': '10.0.0.2'}

def get_vpn_status(vpn_key):
    ret = subprocess.call("ping -c 1 -W1 -q %s >/dev/null" % vpn_map[vpn_key], shell=True)
    if ret != 0:
        bgcolor = '#a00000'
        fgcolor = '#ff0000'
    else:
        bgcolor = '#00a000'
        fgcolor = '#77ff77'

    return {'name': 'vpn_%s' % vpn_key,
            'bgcolor': bgcolor,
            'fgcolor': fgcolor,
            'full_text': vpn_key.upper()}

if __name__ == "__main__":
    st = get_vpn_status('ptk')
    #🖧
    print("%{{B{bgcolor}}}%{{F{fgcolor}}}%{{u{fgcolor} +u}} %{{T2}}%{{T-}} {full_text} %{{-u}}".format(**st))

