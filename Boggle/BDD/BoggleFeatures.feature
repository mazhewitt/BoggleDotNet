Feature: Boggle
	In Order to play the game Boggle 
	As a boggle player 
	I want to be able to submit answers and have my score calculated

Background: Boggle scoring rules
Given a scoring table that looks like:
	| WordLength | Score |
	| 3           | 1     |
	| 4           | 1     |
	| 5           | 2     |
	| 6           | 3     |
	| 7           | 5     |
	| 8           | 11    |
	| 9           | 11    |
	| 10          | 11    |
	| 11          | 11    |
	| 12          | 11    |
	| 13          | 11    |
	| 14          | 11    |
	| 15          | 11    |
	| 16          | 11    |
	| 17          | 11    |
And a valid word list at "ValidWords.txt"

Scenario: User enters a correct word and gets a score
	Given a boggle grid that looks like: 
	"""
	[a,b,c,d,
	 e,f,g,h,
	 i,h,k,l,
	 m,n,o,p]
	 """
	When a user enters the word "cafe" 
	Then they score 1

Scenario: User enters a number of correct words and gets a score
	Given a boggle grid that looks like:
	"""
	[b,t,l,k,
	 h,r,t,d,
	 e,c,v,x,
	 j,d,l,e]
	"""
	When a user enters the words:
	| Word  |
	| herd  |
	| heed  |
	| bleed |
	| led   |
	| deed  |
	| bee   |
	| reed  |
	Then they score 16

Scenario: User enters a mixture of correct and incorrect words and is only given a score for the correct words
	Given a boggle grid that looks like:
	"""
	[i,i,d,i,
	 k,r,e,a,
	 m,o,e,e,
	 d,p,l,u]
	"""
	When a user enters the words:
	| Word    |
	| mole    |
	| read    |
	| red     |
	| kreed   |
	| pole    |
	| pule    |
	| dope    |
	| dreaped |
	| leaped  |
	| reaped  |
	Then they score 19

Scenario: User gets a board with the letter Q, which is represented by Qu in Boggle, enters correct words and gets a score
	Given a boggle grid that looks like:
	"""
	[y,b,u,w,
	 u,e,i,Qu,
	 a,r,v,y,
	 x,m,e,r]
	"""
	When a user enters the words:
	| Word   |
	| queue  |
	| arrive |
	| mire   |
	| qua    |
	Then they score 10