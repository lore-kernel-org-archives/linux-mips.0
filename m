Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709181848.OAA25739@neon.ingenia.ca>
Subject: indirect EFS extent question
Date: Thu, 18 Sep 1997 14:48:28 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970918184828.TaWxMs3hVb0_umLEeJ0bWDx7KxgsSP8ni5UjGuWh9TE@z>

I just read the comment in fs/efs_fs.h properly for the first time,
and things are now much clearer.  I think.

So, is _this_ correct?
	/* 
	 * We're indirect, so we need to start looking in the 
	 * indirect extents.
	 *
	 * EFS indirect extents are really doubly indirect:
	 * inode->di_u.di_extents (1st level extents) refers to
	 * contiguous blocks of extents (2nd level extents).  The
	 * block of these 2nd level extents contain direct extents (or
	 * 3rd level extents).  So, for each indirect extent in
	 * di_u.di_extents, we need to get a block of 2nd-level
	 * extents, get a block from one of the 2nd-level extents, and
	 * then check the extents in that final block -- which, at
	 * long last, contains direct extents.
	 */

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>      Chief System Architect -- will tame sendmail(8) for food       
#>                                                                     
#> "You are a very perverse individual, and I think I'd like to get to 
#>  know you better." --- eric@reference.com                           
