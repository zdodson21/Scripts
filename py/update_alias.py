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
	# Comment Generator
	f'alias cgen="python3 ~/Scripts/py/comment_generator.py"',
	'alias comment-generator="cgen"',
	
	# Curl JSON Output
	f'alias cjson="bash ~/Scripts/sh/curl_json_output.sh"',
	'alias curl-json="cjson"',

	# Python shorthand
	'alias py="python3"',

	# Update aliases
	f'alias update-alias="python3 ~/Scripts/py/update_alias.py"',

	# TODO add user-alias alias to this list
	f"alias user-alias='grep --color=never \"alias \" ~/.zshrc'"
]

def line_exists(alias: str):
	for line in content:
		if (line == alias):
			return True

	return False

def main():
	print(f"Checking {alias_file}")
	for alias in aliases:
		if (not line_exists(alias)):
			with open(alias_path, "a") as file:
				file.write(f"{alias}\n")
				print(f"{Colors.ADDED}Wrote: {alias} to {alias_file}{Colors.REVERT}")
		else:
			print(f"{Colors.IGNORED}{alias} already exists in {alias_file}{Colors.REVERT}")
	

if __name__=="__main__":
	main()