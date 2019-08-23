Swift Meetup
Advance Debugging Tips and Tricks

	◦	List Acronyms not displaying
	⁃	expression  self.acronymsTableView.dataSource=self //Debug expression
	◦	List acronyms are displaying in short form instead of long form
	⁃	expression cellLongText  = localDict[“long”] //Debug expression
	◦	Displaying wrong text for “Wrong Choice entered”
		  	 expression self.resultLabel.text = “wrong” //Debug expression
	◦	Attempts not increasing
	⁃	Create symbolic breakpoint
	⁃	Add symbol -[UILabel setText:]
	⁃	calling convention registers	
	⁃	breakpoint set --one-shot true --name “-[UILabel setText:]” //Find a method where attempts should get updated and add this to Debug expression
			
	◦	Maximum 5 checks and then game should end
	⁃	Add breakpoint where checkCount should get updated.
	⁃	Find the checkCount in variable summary window and add Watch point
	⁃	expression if(checkCount > 5) {gameState = .ended} //Debug expression
	◦	Nudge //Type all in console window one by one
	⁃	po self.view 
	⁃	po self.view.recursiveDescription
	⁃	expression -l objc -O --[self.view recursiveDescription]
	⁃	expression -l objc -O --[`self.view` recursiveDescription]
	⁃	command alias poc  expression -l objc -O --
	⁃	poc <address>
	⁃	po unsafeBitCast(<address>,to:UIImageView.self)
	⁃	po unsafeBitCast(<address>,to:UIImageView.self).frame
	⁃	po unsafeBitCast(<address>,to:UIImageView.self).center
	⁃	po unsafeBitCast(<address>,to:UIImageView.self).center.y
	⁃	expression CATransaction.flush()
	⁃	nudge 0 -5 <address> 
	◦	Facebook Chisel
	◦	thread jump --by 1
	◦	po, p & v

