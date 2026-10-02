# Update aliases

from os import path

class Colors:
	ADDED = "\033[92M"
	IGNORED = "\033[91m"
	REVERT = "\033[0m"

home_dir = path.expanduser('~')
alias_file = ".zshrc"
script_dir_root = "Scripts"

script_path = f"{home_dir}/{script_dir_root}"
alias_path = f"{home_dir}/{alias_file}"

content = []
with open (alias_path, "r") as file:
	for line in file:
		content.append(line.strip())

aliases = [ # ! MAKE SURE EACH LINE ENDS WITH A COMMA!!!
	# CD Space Fix
	'cd..="cd .."',
	
	# Comment Generator
	'cgen="python3 ~/Scripts/py/comment_generator.py"',
	'comment-generator="cgen"',
	
	# Curl JSON Output
	'cjson="bash ~/Scripts/sh/curl_json_output.sh"',
	'curl-json="cjson"',

	# Python shorthand
	'py="python3"',

	# Update aliases
	'update-alias="python3 ~/Scripts/py/update_alias.py"',

	# User Aliases
	"user-alias='grep --color=never \"alias \" ~/.zshrc'",
]

def line_exists(alias: str):
	for line in content:
		if (line == alias):
			return True

	return False

def main():
	print(f"Checking {alias_file}")
	for alias in aliases:
		if (not line_exists(f'alias {alias}')):
			with open(alias_path, "a") as file:
				file.write(f"alias {alias}\n")
				print(f"{Colors.ADDED}Wrote: {alias} to {alias_file}{Colors.REVERT}")
		else:
			print(f"{Colors.IGNORED}{alias} already exists in {alias_file}{Colors.REVERT}")
	

if __name__=="__main__":
	main()