Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709170058.UAA07380@neon.ingenia.ca>
Subject: EFS question
Date: Tue, 16 Sep 1997 20:58:22 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970917005822.Jpaqiz0_Jp2oy0fJrDw6lX8-nqxYeEA6BOsx_mS1h8A@z>

Just to make sure I understand this correctly:
- when an inode has <= EFS_DIRECTEXTENTS extents, they're stored directly
in the inode.
- when an inode has > EFS_DIRECTEXTENTS extents, the extents in the
inode refer to contiguous block regions that contain extents referring
to the real data.

The EFS code that Alan posted, in addition to having a curious
aversion to structures, seemed to think that the first 4 bytes of
dinode->di_u were the block number of a block containing extents, and
thus doesn't work very well with files with numext >
EFS_DIRECTEXTENTS.  I just want to ensure that I make a sane fix.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                 UNIX medicine man -- dark magick, cheap!            
#>                                                                     
#>  When the going gets tough, the tough give cryptic error messages.  
#>          "We believe in rough consensus and running code."          
