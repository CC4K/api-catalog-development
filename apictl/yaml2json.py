import json
import yaml
from yaml import SafeLoader
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("files")
args = parser.parse_args()
path = args.files

yaml_file = open(path, "r")
python_dict = yaml.load(yaml_file, Loader=SafeLoader)

json_file = open(path.replace(".yaml", ".json"), "w")
json.dump(python_dict, json_file, indent=2)

yaml_file.close()
json_file.close()

print(f"{path} -> {path.replace('.yaml', '.json')}")