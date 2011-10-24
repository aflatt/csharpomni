fun! CompleteCSharp(findstart, base)
	if a:findstart
		"The function must return the column where the completion starts.  It must be a
		"number between zero and the cursor column "col('.')".  This involves looking
		"at the characters just before the cursor and including those characters that
		"could be part of the completed item.  The text between this column and the
		"cursor column will be replaced with the matches.  Return -1 if no completion
		"can be done.
		let line = getline(".")
		let start = col('.') - 1
	    while start != 0
			if line[start] =~ '\A'
				return start + 1
			endif
	    	let start -= 1
	    endwhile
		return start
	else
		if !exists(l:assemblies)
			l:assemblies=["System", "System.Core"]
		endif
		return [a:base."blah", b:ref]
		"On the second invocation the arguments are:
		"   a:findstart  0
		"   a:base	the text with which matches should match; the text that was
		"		located in the first call (can be empty)
		"
		"The function must return a List with the matching words.  These matches
		"usually include the "a:base" text.  When there are no matches return an empty
		"List.
endfun

set omnifunc=CompleteCSharp
