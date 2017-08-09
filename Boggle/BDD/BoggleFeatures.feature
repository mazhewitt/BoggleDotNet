Feature: Boggle
	In Order to play the game Boggle 
	As a boggle player 
	I want to be able to submit answers and have my score calculated

Background: Boggle scoring rules
Given a scoring table that looks like:
	| WordLength | Score  |
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
	When a user enters the word "hop" 
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
	| Word |
	| the  |
	| lex  |
	| bred |
	| red  |
	| herb |
	| her  |
	| cert |
	Then they score 7

Scenario: User enters a mixture of correct and incorrect words and is only given a score for the correct words, letters have to be in the valid words list and be adjacent in the grid
	Given a boggle grid that looks like:
	"""
	[i,i,d,i,
	 k,r,e,a,
	 m,o,e,e,
	 d,p,l,u]
	"""
	When a user enters the words:
	| Word    | Score |
	| aid     | 1     |
	| aide    | 1     |
	| red     | 1     |
	| kreep   | 0     |
	| pole    | 1     |
	| leered  | 3     |
	| dop     | 1     |
	| dreaped | 0     |
	| leadier | 5     |
	| idea    | 1     |
	| idiom   | 0     |
	Then they score 14

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
	| quire  |
	| quivery|
	| mare   |
	| yea    |
	Then they score 9