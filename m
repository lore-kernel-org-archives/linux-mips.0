From: "Robert Rusek" <rrusek@teknuts.com>
Subject: RE: Indy SCSI Errors
Date: Thu, 9 May 2002 09:31:01 -0700
Message-ID: <C0F41630CD8B9C4680F2412914C1CF070164C2@WH-EXCHANGE1.AD.WEIDERPUB.COM>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020509154327.GB6197@paradigm.rfc822.org>
Sender: owner-linux-mips@oss.sgi.com
To: 'Florian Lohoff' <flo@rfc822.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020509163101.ZqoIHF-NK6JevDzH1KLQmlO0uwcCSL9goN0vgJ1VJdE@z>

I am familiar with the error that you are referring to.  I just fixed it
by upgrading to kernel 2.4.17.  The error that I am describing, should I
just ignore it and just do a fsck on my main drive every month?  I have
three drives sda1, sdb1, and sdc1 and it only seems to happened on the
sda1.  My sda2 is the swap drive, would that be affecting my sda1 ?

Thanks,
Rob.
     -----Original Message-----
     From: owner-linux-mips@oss.sgi.com 
     [mailto:owner-linux-mips@oss.sgi.com] On Behalf Of Florian Lohoff
     Sent: Thursday, May 09, 2002 8:43 AM
     To: Robert Rusek
     Cc: linux-mips@oss.sgi.com
     Subject: Re: Indy SCSI Errors
     
     
     On Wed, May 08, 2002 at 10:23:18AM -0700, Robert Rusek wrote:
     > I am currently running kernel 2.4.17 and am getting 
     sparatice errors 
     > like the following.  I seen that there had been bugs in the scsi 
     > driver in the earlier kernel versions.  Has anyone 
     encountered this?  
     > Is there a newer kernal that maybe addresses this?
     > 
     > EXT2-fs error (device sd(8,1)): ext2_check_page: bad entry in 
     > directory
     > #110030: unaligned
     >  directory entry - offset=0, inode=6226015, rec_len=95, 
     name_len=95
     > 
     
     The SCSI errors we had on the Indy and Indigo2 happened 
     with multiple disks, disconnects and were pure "read" 
     errors. Filesystem corruption was quite rare. Mostly we 
     had file data corruption on copy. The bug is fixed for at 
     least half a year now.
     
     Do you see any other errors than that ? SCSI errors ?
     
     Flo
     -- 
     Florian Lohoff                  flo@rfc822.org             
     +49-5201-669912
                             Heisenberg may have been here.
     
