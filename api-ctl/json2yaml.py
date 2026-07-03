import json
import yaml
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("files")
args = parser.parse_args()
path = args.files

json_file = open(path, "r")
python_dict = json.load(json_file)

yaml_file = open(path.replace(".json", ".yaml"), "w")
yaml.dump(python_dict, yaml_file, sort_keys=False, default_flow_style=False, width=3000)

json_file.close()
yaml_file.close()

print(f"{path} -> {path.replace('.json', '.yaml')}")