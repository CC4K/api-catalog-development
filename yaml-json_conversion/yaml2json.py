import json
import yaml
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("files")
args = parser.parse_args()
path = args.files

yaml_file = open(path, "r")
yaml_stream = yaml.safe_load(yaml_file)

print(yaml_stream["servers"])
yaml_stream["servers"] = [{"url": "HAHAHAHA"}]

json_file = open(path.replace(".yaml", ".json"), "w")
json.dump(yaml_stream, json_file, indent=2)

yaml_file.close()
json_file.close()

print(f"{path} -> {path.replace('.yaml', '.json')}")