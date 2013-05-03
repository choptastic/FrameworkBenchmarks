
import subprocess
import sys
import setup_util

def start(args):
  try:
    subprocess.check_call("./rebar get-deps", shell=True, cwd="nitrogen-yaws")
    subprocess.check_call("./rebar compile", shell=True, cwd="nitrogen-yaws")
    subprocess.check_call("erl -config etc/app.config -config etc/yaws.config -pa ebin deps/*/ebin -nitrogen db_host \\\"" + args.database_host + "\\\" -args_file etc/vm.args -noshell -detached", shell=True, cwd="nitrogen-yaws")
    return 0
  except subprocess.CalledProcessError:
    return 1
def stop():
  try:
    subprocess.check_call("killall beam.smp", shell=True, cwd="/usr/bin")
    return 0
  except subprocess.CalledProcessError:
    return 1
