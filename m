From: "Robert Rusek" <robru@teknuts.com>
Subject: System lockup problem. . .
Date: Sun, 24 Feb 2002 19:45:06 -0800
Message-ID: <000701c1bdae$d226c580$6601a8c0@delllaptop>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020225034506.87q1OVWs3VDEf31m0LvomwOaUZryLM57R_fPWCddul0@z>

I am running Kernel 2.4.3 on an SGI Indy (IP22).  I built the RedHat 7.1
system from the NFS root obtained from ftp.mips.com. Everything seems to
be working until I added an additional drive.  Now when I do an heavy IO
operation on the additional drive my system locks up.  It seems like
there is not enough buffer allocated somewhere. I know that the drive is
not an issue since when I boot the system up under IRIX 5.3 all works
well..  Has anyone had a similar problem?  Where should I look?  Is is
an Kernel issue or a setting in the OS?

Thanks in advance,
--
Robert Rusek
