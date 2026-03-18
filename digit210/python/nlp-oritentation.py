for line in open("avatarSpeeches.txt"):
	for word in line.split():
		if word.endswith('ar'):
			print(word)
