Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Tue, 16 Sep 1997 18:33:19 -0700
Message-ID: <199709170133.SAA20782@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: EFS question
In-Reply-To: <199709170058.UAA07380@neon.ingenia.ca>
References: <199709170058.UAA07380@neon.ingenia.ca>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970917013319.3jljriXJIsJe8xBo98eSQudzgsuqlzy5bBgSObFvT6A@z>

Mike Shaver writes:
 > Just to make sure I understand this correctly:
 > - when an inode has <= EFS_DIRECTEXTENTS extents, they're stored directly
 > in the inode.
 > - when an inode has > EFS_DIRECTEXTENTS extents, the extents in the
 > inode refer to contiguous block regions that contain extents referring
 > to the real data.
 > 
 > The EFS code that Alan posted, in addition to having a curious
 > aversion to structures, seemed to think that the first 4 bytes of
 > dinode->di_u were the block number of a block containing extents, and
 > thus doesn't work very well with files with numext >
 > EFS_DIRECTEXTENTS.  I just want to ensure that I make a sane fix.
...

      The above is correct.  When there are indirect extents,
the offset field of the first indirect extent in the inode
contains the number of indirect extents, not a file offset.
