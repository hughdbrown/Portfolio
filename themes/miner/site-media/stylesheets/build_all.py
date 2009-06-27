from __future__ import with_statement

if __name__ == "__main__":
	with open('all.css', 'w') as outfile:
		css = ['reset.css','body.css','links.css','buttons.css','sections.css','header.css','footer.css','layout.css','work.css']
		for css_file in css:
			with open(css_file, 'r') as infile:
				outfile.write(infile.read())
