#!/usr/bin/env python3

import psutil, json

'''Emulated /proc/net/dev for selected network device'''
def net_dev(name :str):
    dev = ''
    if name == 'wlp2s0':
        dev = ''
    if name == 'enp0s20u1':
        dev = ''
    return dev
# net_dev = {"wlp2s0": "",
#            "enp0s20u1": ""
# }

net_list = psutil.net_io_counters(pernic=True)
net_list.pop('lo')

net_in = 0
net_out = 0

new_list = []

# { <name>: { up, down } }
for k, v in net_list.items():

    net_out += v.bytes_sent / 1000 / 1000
    net_in += v.bytes_recv / 1000 / 1000
    itm = {
        'name': net_dev(k),
        'up': v.bytes_sent / 1000 / 1000,
        'down': v.bytes_recv / 1000 / 1000
    }
    new_list.append(itm)

json_dict = {
    'down': net_in,
    'up': net_out,
    'list': new_list
}

json_object = json.dumps(json_dict, indent=4)
print(json_object)