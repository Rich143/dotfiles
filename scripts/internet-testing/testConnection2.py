import json
import pingparsing
import time
import math
import datetime
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--verbose", help="Display full ping data",
                    action="store_true")
parser.add_argument("--server", required=True, help="The server to ping")
parser.add_argument("--numPings", default=2, type=int, help="The number of pings to do per ping transmit")
parser.add_argument("--minOutageTime", type=int, default=60, help="The minimum time losing packets which is considered an outage (in seconds)")
parser.add_argument("--logFile", help="Path to write ping results log file to")
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

MAX_LATENCY = 500.0
INF = float('inf')

SERVER = args.server
print("Pinging server: {}".format(SERVER))


transmitter = pingparsing.PingTransmitter()
ping_parser = pingparsing.PingParsing()

transmitter.destination = SERVER
transmitter.count = args.numPings
transmitter.deadline = "30sec"
transmitter.timeout = "10sec"

outage = False
lastSuccess = datetime.datetime.now()

def print_error(lastSuccess):
    severity_string = bcolors.FAIL + " ERROR: " + bcolors.ENDC
    print("{}".format(datetime.datetime.now()) + severity_string + "Outage Begin (last successful ping: {})".format(lastSuccess))

def print_ok(lastSuccess):
    outageLength = datetime.datetime.now() - lastSuccess
    outageLengthMinutes = outageLength.total_seconds() / 60
    print("{}".format(datetime.datetime.now()) + bcolors.OKGREEN + " OK:" + bcolors.ENDC + " Outage over (lasted {0:.3g} minutes)".format(outageLengthMinutes))

def wait(lastRun, seconds=60):
    delta = datetime.timedelta(seconds=seconds)
    while ( datetime.datetime.now() - lastRun ) < delta:
        time.sleep(1)

def LOG(logFile, message):
    if logFile is not None:
        logFile.write("{}: {}\n".format(datetime.datetime.now(), message))
        logFile.flush()

if args.logFile is not None:
    logFile = open(args.logFile, "w")
else:
    logFile = None

while True:
    result = transmitter.ping()
    result_dict = ping_parser.parse(result).as_dict()

    LOG(logFile, result_dict)
    if args.verbose:
        print(result_dict)

    packets_lost = result_dict['packet_loss_count']

    if packets_lost is None:
        packets_lost = math.inf

    if packets_lost < args.numPings:
        # Success
        # Lost no packets or less than max allowed number of lost packets
        if outage:
            print_ok(lastSuccess)
            outage = False
        lastSuccess = datetime.datetime.now()
    else:
        if not outage:
            if datetime.datetime.now() - lastSuccess >= datetime.timedelta(seconds=args.minOutageTime):
                print_error(lastSuccess)
                outage = True
