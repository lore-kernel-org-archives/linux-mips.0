Subject: system call fork in  init.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Tue, 16 Oct 2001 13:02:06 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B14A7CE@ex2k.pcs.psdc.com>
content-class: urn:content-classes:message
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20011016200206.vX5-FTC94M_zt1Qn_ZskNjJ7Ji4QgFxGzPSSRzDt608@z>

Hi, All:

Currently, I am porting Linux 2.2.12 to mips a r3000 CPU. When the init
program forked a child process and the the scheduler try to run it, the
child's stack are all zeros. 

Any one help will be greatly appreciated.

Thanks,

Steven Liu
