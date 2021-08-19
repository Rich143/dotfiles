import json
import pingparsing
import time
import math
import datetime
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--verbose", help="Display full ping data",
                    action="store_true")
parser.add_argument("--server", help="The server to ping")
parser.add_argument("--numPings", default=2, type=int, help="The number of pings to do per ping transmit")
parser.add_argument("--minOutageTime", type=int, help="The minimum time losing packets which is considered an outage")
args = parser.parse_args()

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[32m'
    WARNING = '\033[33m'
    ERROR = '\033[91m'
    FAIL = '\033[31m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

SERVER = "google.com"
MAX_LATENCY = 500.0
INF = float('inf')

if args.server:
    SERVER = args.server
    print("Pinging server: {}".format(SERVER))


transmitter = pingparsing.PingTransmitter()
ping_parser = pingparsing.PingParsing()

transmitter.destination = SERVER
transmitter.count = args.numPings
transmitter.deadline = "30sec"
transmitter.timeout = "10sec"

error = False
signal_ok = True

def print_error(latency, packets_lost):
    if packets_lost != 0:
        severity_string = bcolors.FAIL + " FAIL:" + bcolors.ENDC
    else:
        severity_string = bcolors.WARNING + " ERROR:" + bcolors.ENDC
    print("{}".format(datetime.datetime.now()) + severity_string + " Packets Lost: {} Latency: {}".format(packets_lost, latency))

def print_ok(latency):
    print("{}".format(datetime.datetime.now()) + bcolors.OKGREEN + " OK:" + bcolors.ENDC + " Latency {}".format(latency))

def wait(lastRun, seconds=60):
    delta = datetime.timedelta(seconds=seconds)
    while ( datetime.datetime.now() - lastRun ) < delta:
        time.sleep(1)

while True:
    lastRun = datetime.datetime.now()

    result = transmitter.ping()
    result_dict = ping_parser.parse(result).as_dict()

    if args.verbose:
        print(result_dict)

    packets_lost = result_dict['packet_loss_count']
    latency = result_dict['rtt_avg']

    if latency is None:
        latency = math.inf

    if packets_lost is None:
        packets_lost = math.inf

    if packets_lost != 0 or latency > MAX_LATENCY:
        error = True
    else:
        if error:
            signal_ok = True
            error = False

    if error:
        print_error(latency, packets_lost)
    elif signal_ok:
        print_ok(latency)
        signal_ok = False

    wait(lastRun, seconds=60)
