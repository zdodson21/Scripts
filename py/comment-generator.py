# alias cgen="python3 ~/Scripts/py/comment-generator.py"
# alias comment-generator="cgen"

def main():
	# ! ########################## Init Vars ######################### ! #
	# Text that appears in the divider
	text: str = input("Enter comment text contents: ")

	# What is used to fill the body of the comment
	divider_style: str = input("Enter divider style character: ")
	if not divider_style or len(divider_style) > 1:
		divider_style = '-'

	# Comment syntax for language
	comment_style: str = input("Enter comment style character: ")
	if not comment_style:
		comment_style = "//"

	# Intended for use with Better Comments VSCode extension characters (!, ?, *, TODO)
	extra_symbol: str = input("Enter extra symbol: ")

	# Minimum comment length
	min_str_len: str = input("Minimum string length: ")
	if not min_str_len or not min_str_len.isdigit():
		min_str_len: int = 70
	else:
		min_str_len: int = int(min_str_len)

	# ! #################### String Concatenation #################### ! #
	end_comment_style = ">" if comment_style == "<!" else comment_style[::-1]
	div1: str = ""
	div2: str = ""
	if extra_symbol:
		extra_symbol = f" {extra_symbol}"

	final_str: str = f"{comment_style}{extra_symbol} {div1} {text} {div2}{extra_symbol} {end_comment_style}"
	last_add_to_1 = False

	while len(final_str) < min_str_len:
		if not last_add_to_1:
			div1 += divider_style
		else:
			div2 += divider_style
		last_add_to_1 = not last_add_to_1

		final_str: str = f"{comment_style}{extra_symbol} {div1} {text} {div2}{extra_symbol} {end_comment_style}"

	print(final_str)

if __name__=="__main__":
	main()